# Maintainer: Gregor Kaelin <kaelingre at gmail dot com>

pkgname=xeus-zmq
pkgver=1.0.3
pkgrel=1
pkgdesc="ZeroMQ-based middleware for xeus"
arch=("x86_64")
url="https://github.com/jupyter-xeus/xeus-zmq"
license=('BSD')
depends=('xeus' 'zeromq')
makedepends=('cmake' 'cppzmq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jupyter-xeus/xeus-zmq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6419690d2b21b8666d9333140e9eaabe67347e4624904756ca1fec0757913bc')
options=(staticlibs)

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="${pkgdir}" install
}
