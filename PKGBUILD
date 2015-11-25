# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Blake Imsland <blake@retroco.de>

pkgname=uchardet
pkgver=0.0.3
pkgrel=1
pkgdesc='Encoding detector library ported from Mozilla'
arch=('i686' 'x86_64')
url='https://github.com/BYVoid/uchardet'
license=('MPL')
makedepends=('cmake')
source=("https://github.com/BYVoid/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8caba57524b6e306e764b4dabf5bfec48b6f9d89b73543ed7c95263890e2006f')

build() {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}
