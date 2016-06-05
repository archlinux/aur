# Maintainer: Michael Baer <derbaer@clockwork-origins.de>
pkgname=clockutils
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight c++ library for commonly needed tasks. Optimized for simplicity and speed."
arch=('i686' 'x86_64')
url="http://clockwork-origins.de/en/clockUtils"
license=('LGPL2.1')
depends=('gcc-libs>=4.8.2' 'glibc')
makedepends=('cmake')
source=(http://clockwork-origins.de/clockUtils/downloads/$pkgname-$pkgver-src.zip)
sha256sums=('72f8ba0fbea4fd2fca25d4b1d25963b0fbaf59bd47584b98d48f25547af2c9ff')

build() {
	cd "$pkgname-$pkgver-src"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .

	make
}

package() {
	cd "$pkgname-$pkgver-src"

	make DESTDIR="$pkgdir/" install
}
