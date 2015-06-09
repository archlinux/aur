# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=udis86
pkgver=1.7.2
pkgrel=1
pkgdesc="A minimalistic disassembler library"
arch=('i686' 'x86_64')
url="http://udis86.sourceforge.net/"
license=('BSD')
depends=('python2')
options=('staticlibs')
source=('https://downloads.sourceforge.net/udis86/udis86-1.7.2.tar.gz')
sha1sums=('f55dec2d5319aac9d0a7ae2614ddcc7aa73d3744')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-python=/usr/bin/python2
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
