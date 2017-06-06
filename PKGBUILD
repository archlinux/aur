# Maintainer: zhangjun <2281979437@qq.com>
pkgname=vim-drawit
pkgver=1
pkgrel=1
epoch=
pkgdesc="DrawIt is a plugin which allows one to draw lines left, right, up, down, and along both slants. Optionally one may "cap" the lines with arrowheads.  One may change the horizontal, vertical, slant, and crossing characters to whichever characters one wishes. "
arch=(any)
url="https://vim.sourceforge.io/scripts/script.php?script_id=40"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("vim-drawit.vba.gz::https://vim.sourceforge.io/scripts/download_script.php?src_id=21108")
noextract=()
md5sums=('791c58020cfdf9b9e769f276da1066a0')
validpgpkeys=()

prepare() {
	cd .
}

build() {
	vim vim-drawit.vba -c "let g:vimball_home=\".\"" -c "so %" -c "q"
}

check() {
	cd .
}

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/plugin/"
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/doc/"
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/autoload/"
	install -Dm 0664 plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm 0664 doc/DrawIt.txt "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm 0664 autoload/* "$pkgdir/usr/share/vim/vimfiles/autoload/"
}
