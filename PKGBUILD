# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librasterlite2-devel
_pkgname=librasterlite2
pkgver=1.0.0
pkgrel=1
pkgdesc="librasterlite2 is an open source library that stores and retrieves huge raster coverages using a SpatiaLite DBMS."
url="https://www.gaia-gis.it/fossil/librasterlite2/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite>=4.1.1-3' 'libpng'  'proj')
conflicts=()
replaces=()
source=("http://www.gaia-gis.it/gaia-sins/${_pkgname}-sources/librasterlite2-${pkgver}-devel.tar.gz")

md5sums=('e917ee560c7d1c576af274322bb9eddc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-devel"
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-devel"
  make DESTDIR="${pkgdir}" install
}
