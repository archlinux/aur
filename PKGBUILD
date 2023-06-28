# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile
pkgver=0.5.1
pkgrel=1
pkgdesc='Library for kernel core dump file access'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib' 'zstd')
source=(https://github.com/ptesarik/libkdumpfile/releases/download/v$pkgver/libkdumpfile-$pkgver.tar.bz2)
sha256sums=('0eaae02080cd9b908e5758c662f1d8de10350dba0e9c94481b19ffda682cdc7b')

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
