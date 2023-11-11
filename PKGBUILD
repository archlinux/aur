# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile
pkgver=0.5.3
pkgrel=1
pkgdesc='Library for kernel core dump file access'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib' 'zstd')
source=(https://github.com/ptesarik/libkdumpfile/releases/download/v$pkgver/libkdumpfile-$pkgver.tar.bz2)
sha256sums=('1a67d4a6f23893dfafcdea8c67d6b35928610320023cb0e98ae25a394c0f4fd2')

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
