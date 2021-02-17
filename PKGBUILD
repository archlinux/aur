# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=xkb-switch
pkgver=1.8.5
pkgrel=1
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/grwlf/xkb-switch'
license=('GPL3')
depends=('libx11' 'libxkbfile')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ierton/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('89e7cc64a3bfc481b0e341b79320de4f0adbdba49b551988fe4bf02f6ae9e003')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
