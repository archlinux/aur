# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=xkb-switch
pkgver=1.6.0
pkgrel=1
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/grwlf/xkb-switch'
license=('GPL3')
depends=('libx11' 'libxkbfile')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ierton/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('17ddd00a09945f634654ddf98d55023b0727755f828706747fd5227e2651633d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
