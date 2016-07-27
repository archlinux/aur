# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Blake Imsland <blake@retroco.de>

pkgname=uchardet
pkgver=0.0.6
pkgrel=1
pkgdesc='Encoding detector library ported from Mozilla'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/uchardet'
license=('MPL')
makedepends=('cmake')
depends=('gcc-libs')
source=("https://www.freedesktop.org/software/${pkgname}/releases/${pkgname}-${pkgver}.tar.xz")

build() {
	cd ${pkgname}-${pkgver}
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('8351328cdfbcb2432e63938721dd781eb8c11ebc56e3a89d0f84576b96002c61')
sha384sums=('4e70d71644094d51fc764fd91233b729178e51faf44d31598008e63e1284077da1cdc282299f41b77c932f756ad64b39')
sha512sums=('eceeadae060bf277e298d709856609dde32921271140dc1fb0a33c7b6e1381033fc2960d616ebbd82c92815936864d2c0743b1b5ea1b7d4a200df87df80d6de5')
