# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=zurl
pkgver=1.5.1
pkgrel=1
pkgdesc="Zurl is an HTTP and WebSocket client daemon with a ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('MIT')
depends=("qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
md5sums=("037c545c0ee5fbccbcb7e8464958b679")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
