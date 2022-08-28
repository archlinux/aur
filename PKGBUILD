# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: glatavento <glatavento at outlook dot com>

pkgname=libjaylink
pkgver=0.3.1
pkgrel=1
pkgdesc='Library for accessing SEGGER J-Link and compatible devices'
arch=('x86_64')
url='https://gitlab.zapb.de/libjaylink/libjaylink'
license=('GPL')
depends=('glibc')
optdepends=('libusb' 'doxygen: Required for API documentation')
provides=("$pkgname.so")
changelog=NEWS
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('3a1dea87a0ec57c24d2e017b0f5fc11953edda8fac8eeec7c5a1452a4c8816f6')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
