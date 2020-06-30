# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
pkgver=0.4.3
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/lemire/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lemire/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('8ae54d32e84c5a7d45183bab5817a0d62d9b6e5a2a89c20d9d07475f5429d0b3')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr/" -DSIMDJSON_JUST_LIBRARY=On
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
