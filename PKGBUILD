# Maintainer: Michael Baer <derbaer@clockwork-origins.de>
pkgname=clockutils
pkgver=0.4.0
pkgrel=1
pkgdesc="A lightweight c++ library for commonly needed tasks. Optimized for simplicity and speed."
arch=('i686' 'x86_64')
url="http://clockwork-origins.de/en/clockUtils"
license=('LGPL2.1')
depends=('gcc-libs>=4.8.2' 'glibc')
makedepends=('cmake')
source=(http://clockwork-origins.de/clockUtils/downloads/$pkgname-$pkgver-src.zip)
sha256sums=('74d6771389601434a427872908b798f35b76b3e116e8ee3eca0f82a055733e13')

build() {
	cd "$pkgname-$pkgver-src"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .

	make
}

package() {
	cd "$pkgname-$pkgver-src"

	make DESTDIR="$pkgdir/" install
}
