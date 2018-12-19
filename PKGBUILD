# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=xkb-switch
pkgver=1.5.0
pkgrel=5
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/ierton/xkb-switch'
license=('GPL3')
depends=('libx11' 'libxkbfile')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ierton/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('5b9ee5fd2c06360ed1297e4e58dda19ae1336d85')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
