# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=zurl
pkgver=1.10.1
pkgrel=1
pkgdesc="Zurl is an HTTP and WebSocket client daemon with a ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('MIT')
depends=("qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
sha512sums=('201de7854bf2ea0c0340a491676b3c650dcdbe3da08344d654941e1c293e06ad8b1eee2292eae8617b284782441873b6db2ca5353f5c71f449c0965d3143fe9e')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --qtselect=5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
