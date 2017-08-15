# Maintainer:  Matthew Hiles <matthew.hiles@gmail.com>
# Contributor: Jeffrey David Johnson <jefdaj@gmail.com>
 
pkgname=ctk
pkgver=8.0.4001
pkgrel=1
pkgdesc="A Curses implementation of Tk / Make your Tk apps CUI apps"
url="http://rkeene.org/devel/ctk/"
depends=(tcl ncurses)
arch=(any)
license=("MIT")
options=()
source=(http://rkeene.org/devel/ctk/$pkgname-$pkgver.tar.gz)
md5sums=('3d2746f499cf0d2158dfbedfad0afc47')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}