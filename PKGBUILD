# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=zurl
pkgver=1.8.0
pkgrel=1
pkgdesc="Zurl is an HTTP and WebSocket client daemon with a ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('MIT')
depends=("qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
sha512sums=("2657bc05974e47eeb1a31652201d3ce014fe1e6d3a5f9304a1ca666a525f4d3e0d98f1c480c48dd10bd4dfd0e63a813ca3c739e872f714b7ce34118b76034bc6")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --qtselect=5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
