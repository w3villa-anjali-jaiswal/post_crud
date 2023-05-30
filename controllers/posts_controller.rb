class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'new'
    end
  end
  

  def destroy
   @post = Post.find(params[:id]) 
   @post.destroy
   if @post.destroy
    redirect_to posts_path
   end
  end

  private 
  
  def post_params
    params.require(:post).permit(:body,:title,:description)
  end
end
