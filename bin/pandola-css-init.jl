#!/usr/bin/env julia

path = "$(homedir())/pandola/pcs/dist/"

function check_exist(f)
    target = "$(pwd())/$f"
    return isfile(target)
end    

function make_link(f)
    file = basename(f)
    from = "$path$file"
		to = "$(pwd())/$file"
		println("Make Link:\n$from ->\n$to")
		symlink(from, to)
    println("OK\n")
end

function main()
    files = readdir(path)
    result_checked = all(map(check_exist, files))
    if(!result_checked)
        println("OK, Check done.\n")
        map(make_link, files)
    else
        println("Err, Files existed.")
    end
end

# Main
main()