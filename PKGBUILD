# Maintainer: Guillaume Bury <guillaume.bury at gmail dot com>
# Author: Fredrik Johansson <fredrik.johansson at gmail dot com>

pkgname=calcium
pkgver=0.4.1
pkgrel=1
pkgdesc="C library for exact computation with real and complex numbers"
arch=(x86_64)
url="https://fredrikj.net/calcium/"
license=('LGPL2.1')
depends=(glibc gmp flint arb antic)
makedepends=(python)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fredrik-johansson/calcium/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5fbc997e8c9e76c88cd85c12a86f0f14c4ebe602e9f7f11e11f0ca1f89c5d81c')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
