# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile
pkgver=0.5.4
pkgrel=1
pkgdesc='Library for kernel core dump file access'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib' 'zstd')
source=(https://github.com/ptesarik/libkdumpfile/releases/download/v$pkgver/libkdumpfile-$pkgver.tar.bz2)
sha256sums=('a661003a81a8cabe40b4cfe6edcfe019d8877f0478133b11e884a4526d8697c4')

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
