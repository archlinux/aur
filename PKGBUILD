# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile
pkgver=0.5.2
pkgrel=1
pkgdesc='Library for kernel core dump file access'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib' 'zstd')
source=(https://github.com/ptesarik/libkdumpfile/releases/download/v$pkgver/libkdumpfile-$pkgver.tar.bz2)
sha256sums=('eac42f63956a8ca0ef987cb29dfe51b6ce8427b05708d172175ff9b79051a9b3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --without-python
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
