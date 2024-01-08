# Maintainer: Gregor Kaelin <kaelingre at gmail dot com>

pkgname=xeus-zmq
pkgver=1.2.0
pkgrel=1
pkgdesc="ZeroMQ-based middleware for xeus"
arch=("x86_64")
url="https://github.com/jupyter-xeus/xeus-zmq"
license=('BSD')
depends=('xeus' 'zeromq')
makedepends=('cmake' 'cppzmq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jupyter-xeus/xeus-zmq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ecde713e9c5d5bd28fdd61448a6ec41a74a7ae6b76a81b65b7a84f602dfd9244')
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
