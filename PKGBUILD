# Maintainer: Benjamin James <benjamin-james@utulsa.edu>

pkgname=humans
pkgver=0.1
pkgrel=1
pkgdesc="Don't you wanna killall humans?"
arch=('any')
url="https://github.com/benjamin-james/humans"
license=('GPL3')
depends=('glibc')
provides=('humans')
source=(https://github.com/benjamin-james/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('b8391a077fc104b1b72067c45c6457ff')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	  cd "${pkgname}-${pkgver}"
	  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
