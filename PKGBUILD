# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
pkgver=0.5.0
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/lemire/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lemire/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('60846ae482e17230e41f5abf8f058a6e367c2a0ec1b5a6fd7a883a54ad21bee8')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr/" -DSIMDJSON_JUST_LIBRARY=On
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
