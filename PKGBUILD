# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=uz80as
pkgdesc='Z80 assembler compatible with the Telemark (TASM) syntax'
pkgver=2.02
pkgrel=1
url=https://jorgicor.niobe.org/uz80as
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(automake autoconf)
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('c487d0ada4b39f747d1cc5cf3cc83a404e71e3e2a4e909ce3b6020ca0eb4dc51')

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package () {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

check () {
	cd "$pkgname-$pkgver"
	make check
}
