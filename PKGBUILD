# Maintainer: Jean-Luc Juganniere <jljug@hotmail.com>
pkgname=xpuz
_pkgname=xpuz
pkgver=2.7.1
pkgrel=1
pkgdesc="A fork of xjig 2.5, the jigsaw puzzle."
arch=('x86_64')
url="http://webmayo.com/xjigsaw/"
license=('GPL3')
makedepends=('git')
depends=('libx11' 'libjpeg-turbo')
source=("$pkgname::git+https://github.com/JeanLucJFr/$_pkgname.git" "Makefile")
md5sums=('SKIP'
         '6d74c47275d958909ac9a496fc8db541')

prepare() {
	cd "$srcdir/$pkgname"
	cp ../Makefile Makefile
	cp xpuz.man xpuz.6
	gzip xpuz.6
	}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
