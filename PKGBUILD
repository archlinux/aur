# Maintainer: Joris Vink <joris@sanctorum.se>

pkgname=libkyrka
pkgver=1.0.0
pkgrel=1
pkgdesc="A library implementation of the sanctum protocol"
arch=('x86_64')
url="https://conclave.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/libkyrka/${pkgname}-${pkgver}.tgz")
sha256sums=('c1051a6a016a4a74af95682e10f3d8e95a53028fda8579235f448b29e1894240')

build() {
	unset CFLAGS
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="" make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
