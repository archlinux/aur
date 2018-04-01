# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=zurl
pkgver=1.9.1
pkgrel=1
pkgdesc="Zurl is an HTTP and WebSocket client daemon with a ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('MIT')
depends=("qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
sha512sums=('48c1b88105741d982933af384be74d0459cb6446b483a43973cc9a3912ec353437611cd7fb75a2ff461a58fb6e9e57f4dc4dac2c5488f5b1f0c67a8df630023e')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --qtselect=5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
