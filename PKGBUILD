# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librasterlite2-devel
_pkgname=librasterlite2
pkgver=1.1.0
_pkgver=1.1.0-beta0
pkgrel=1
pkgdesc="librasterlite2 is an open source library that stores and retrieves huge raster coverages using a SpatiaLite DBMS."
url="https://www.gaia-gis.it/fossil/librasterlite2/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite>=4.1.1-3' 'libpng'  'proj' 'openjpeg2' 'charls1')
conflicts=()
replaces=()
source=("http://www.gaia-gis.it/gaia-sins/${_pkgname}-sources/librasterlite2-${_pkgver}.tar.gz")
md5sums=('062cbda41f6faaf83de57a1f2b258b95')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
