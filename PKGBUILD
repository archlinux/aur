# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile
pkgver=0.4.1
pkgrel=1
pkgdesc='Library for kernel core dump file access'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib')
source=(https://github.com/ptesarik/libkdumpfile/releases/download/v$pkgver/libkdumpfile-$pkgver.tar.bz2)
sha256sums=('2516de591b776f7b218bd6f7d0aa86e3ba6b577caf3c59331adb81ab5e8d2e08')

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
