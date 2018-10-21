# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Pietro Zambelli <peter.zamb at gmail dot com>

pkgname=libspatialite-devel
_pkgname=libspatialite
pkgver=5.0.0
_pkgver=5.0.0-beta0
pkgrel=1
pkgdesc="SQLite extension to support spatial data types and operations. Development version"
arch=('x86_64')
url="https://www.gaia-gis.it/fossil/libspatialite"
license=('MPL' 'GPL' 'LGPL')
depends=('geos' 'libfreexl' 'libxml2' 'proj' 'sqlite' 'librttopo-devel')
provides=(libspatialite)
replaces=(libspatialite)
source=(http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-$_pkgver.tar.gz)
sha256sums=('caacf5378a5cfab9b8e98bb361e2b592e714e21f5c152b795df80d0ab1da1c42')

build() {
  cd "${srcdir}"/$_pkgname-$_pkgver

  ./configure --prefix=/usr --enable-libxml2 --enable-librttopo
  make
}

package() {
  cd "${srcdir}"/$_pkgname-$_pkgver

  make DESTDIR="${pkgdir}" install
}
