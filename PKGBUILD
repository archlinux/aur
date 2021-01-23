# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>
pkgname=terminal-mines
pkgver=1.2.0
pkgrel=1
pkgdesc="An ncurses-based minesweeper game."
url='https://github.com/accatyyc/terminal-mines'
license=("custom:Unknown")
arch=('i686' 'x86_64')
source=("git+https://github.com/accatyyc/terminal-mines#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update
}
build() {
	cd "$pkgname"
	make
}
package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
