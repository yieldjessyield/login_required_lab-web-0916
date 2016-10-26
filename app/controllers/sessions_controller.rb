class SessionsController < ApplicationController
skip_before_action :require_login, only: [:create]

  def new

  end

  def create
    # byebug
    if params[:name] == nil || params[:name] == ""
      redirect_to root_path
    else
      #byebug
      user = params[:name]
      session[:name] = user
      redirect_to '/sessions/show'
    end
  end

  def index
    redirect_to session_path
  end

  #   def create
  #   return redirect_to(controller: 'sessions',
  #                      action: 'new') if !params[:name] || params[:name].empty?
  #   session[:name] = params[:name]
  #   redirect_to controller: 'application', action: 'hello'
  # end

  def destroy
    if session[:name] = ""
      session[:name] = nil
    else
    session[:name].destroy
    end
    redirect_to root_path
  end

end
