require 'sinatra'
require 'sinatra/reloader'

class Todo
	attr_accessor :done, :text, :important
end

TODOS = []
#constant ^^ only set once, stick around forever
#use as a standin for a database
#convention is to have this all caps

get '/' do
	erb :todos, locals: {todos: TODOS}
end

post '/add' do
	t = Todo.new
	t.text = params[:todo]

	TODOS << t
		#erb :todos, locals: {todos: TODOS}
	redirect('/')
end	
get	'/done/:i' do
	TODOS[params[:i].to_i].done = true
	redirect('/')
end
get '/important/:i' do
	TODOS[params[:i].to_i].done = true
	redirect('/')
end