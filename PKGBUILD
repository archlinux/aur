# Maintainer: Joris Vink <joris@sanctorum.se>

pkgname=libkyrka
pkgver=0.4.0
pkgrel=1
pkgdesc="A library implementation of the sanctum protocol"
arch=('x86_64')
url="https://conclave.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/libkyrka/${pkgname}-${pkgver}.tgz")
sha256sums=('5ef41d52c4f7a90f9e2ab0f334229be8c8401058c165b03f46f12a0247309741')

build() {
	unset CFLAGS
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="" make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
