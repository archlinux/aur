# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
# Packager: Peter Semiletov 

pkgname=upsm
pkgver=2.2.0
pkgrel=1
pkgdesc="Qt-based ups monitor (front-end for upsc from Network UPS Tools)."
arch=('x86_64')
url="https://github.com/psemiletov/upsm"
license=('GPL')
depends=('qt5-base' 'gcc-libs')

source=(https://github.com/psemiletov/upsm/archive/$pkgver.tar.gz)


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}

md5sums=(9b367d9eb3816e819eea7d633c410e72)
