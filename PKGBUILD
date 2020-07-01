# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=simdjson
pkgver=0.4.5
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/lemire/simdjson"
license=('APACHE')
depends=(gcc-libs)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lemire/simdjson/archive/v$pkgver.tar.gz")
sha256sums=('2d5d125909f0f4bfebed5ea84cc1c6ccafe4730db336d2afcb5402369181e19e')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr/" -DSIMDJSON_JUST_LIBRARY=On
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
