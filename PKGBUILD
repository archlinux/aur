# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
pkgver=0.3.1
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/lemire/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lemire/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('9ae0b77139d6b854fe4d25db5e525762d3f7880f7146329767078397b6ed2f94')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr/"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
