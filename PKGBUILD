# Maintainer: Royce Fan <fchunhuei@gmail.com>

pkgname=g3log
pkgver=1.3.3
pkgrel=1
pkgdesc="An open-source C++ asynchronous logger with dynamic sinks"
arch=('x86_64')
url="https://github.com/KjellKod/g3log"
license=('Unlicense')
depends=()
makedepends=('cmake' 'gtest')
source=("https://github.com/KjellKod/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d8cae14e1508490145d710f10178b2da9b86ce03fb2428a684fff35576fe5d5c')

build() {
	cd "$pkgname-$pkgver"
	mkdir _build
	cmake . -B _build
	# cmake . -DADD_G3LOG_UNIT_TEST=ON -B _build
	cmake --build _build
}

check() {
	cd "$pkgname-$pkgver"
	# cmake --build _build --target test
}

package() {
	cd "$pkgname-$pkgver"
	cmake --build _build --target install -- DESTDIR="$pkgdir/"
}
