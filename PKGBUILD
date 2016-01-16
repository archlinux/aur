# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Blake Imsland <blake@retroco.de>

pkgname=uchardet
pkgver=0.0.5
pkgrel=1
pkgdesc='Encoding detector library ported from Mozilla'
arch=('i686' 'x86_64')
url='https://github.com/BYVoid/uchardet'
license=('MPL')
makedepends=('cmake')
source=("https://github.com/BYVoid/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7c5569c8ee1a129959347f5340655897e6a8f81ec3344de0012a243f868eabd1')

build() {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}
