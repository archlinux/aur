# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=virtualpg2-devel
_pkgname=virtualpg
pkgver=2.0.0
_pkgver=2.0.0-RC0
pkgrel=2
pkgdesc="VirtualPG is a loadable dynamic extension to both SQLite and SpatiaLite."
url="https://www.gaia-gis.it/fossil/virtualpg/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite' 'sqlite' 'postgresql-libs' 'postgis')
conflicts=('virtualpg')
replaces=()
source=("http://www.gaia-gis.it/gaia-sins/virtualpg-sources/virtualpg-${_pkgver}.tar.gz")

md5sums=('b1a02e6a86665d15434f2fb376588cb5')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix="/usr"
  make -j3
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
