# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=zurl
pkgver=1.7.1
pkgrel=1
pkgdesc="Zurl is an HTTP and WebSocket client daemon with a ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('MIT')
depends=("qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
md5sums=("b72b829cb1a7be2b9ec0071c7a9b8116")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --qtselect=5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
