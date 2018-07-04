# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=vim-gdscript
gitname=vim-gdscript3
pkgver=0.1
pkgrel=1
pkgdesc="Vim syntax highliting for the Godot Game Engine scripting language GDScript"
arch=('any')
url="https://github.com/calviken/$gitname"
source=("$url/archive/v$pkgver.tar.gz")
provides=('vim-gdscript')
conflicts=('vim-gdscript-git')
sha256sums=('6b2f1880f2662bb7cb39ba0287c648d36b3e5384a1f4be1e513ea32194577f48')

package() {
	local vim_file="gdscript3.vim"
	local vim_share="/usr/share/vim/vimfiles"

	cd "$srcdir/$gitname-$pkgver"

	install -Dm644 "ftdetect/gdscript3.vim" "$pkgdir/$vim_share/ftdetect/gdscript3.vim"
	install -Dm644 "ftplugin/gdscript3.vim" "$pkgdir/$vim_share/plugin/gdscript3.vim"
	install -Dm644 "indent/gdscript3.vim" "$pkgdir/$vim_share/indent/gdscript3.vim"
	install -Dm644 "syntax/gdscript3.vim" "$pkgdir/$vim_share/syntax/gdscript3.vim"
	install -Dm644 "syntax/gdscript3.vim" "$pkgdir/$vim_share/syntax/gdscript3.vim"

	# Recreate all the directories under the python subdirectory in our filesystem:
	find python -type d -exec install -dm755 "$pkgdir/$vim_share/"{} \;

	# Now copy all the files with the right permissions:
	find python -type f -exec install -Dm644 {} "$pkgdir/$vim_share/"{} \;
}

