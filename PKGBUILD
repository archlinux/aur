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
sha256sums=('8d3e2cc98bb762df37f62700cfa81bbd4b51212f4d992a22bcca852eaee5f1aa')

build() {
	cd "$pkgname-$pkgver-src"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .

	make
}

package() {
	cd "$pkgname-$pkgver-src"

	make DESTDIR="$pkgdir/" install
}
