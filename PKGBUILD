# Maintainer: Matthew Longley <randomticktock@gmail.com>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net/"
license=("GPL")
depends=(pcre zlib ncurses openssl)
source=("git://github.com/Longlius/tinyfugue.git")
sha256sums=('SKIP')

# build function
build() {
	cd $srcdir/tinyfugue

	./configure --prefix=/usr --enable-termcap=ncurses
	make
}

# package function
package() {
	cd $srcdir/tinyfugue

	mkdir $pkgdir/usr
	make prefix=$pkgdir/usr install
}
