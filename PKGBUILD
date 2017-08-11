# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=vim-gdscript
pkgver="1.0"
pkgrel=1
pkgdesc="Vim syntax highliting for the Godot Game Engine scripting language GDScript"
arch=('any')
url="https://github.com/Rubonnek/vim-gdscript"
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('a291eb0ad0ee513c48955ededc7478d9082795cf6d88fedbf76903ec0b5e4840')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	local target_directory="$pkgdir/usr/share/vim/vimfiles"
	for vimfile_directory in `find . -type d`
	do
		# Filter the current directory. We don't need it:
		if [[ $vimfile_directory == "." ]]; then
			continue;
		fi
		install -Dm644 "$vimfile_directory/gdscript.vim" "$target_directory/$vimfile_directory/gdscript.vim"
	done
}

