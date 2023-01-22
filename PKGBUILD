# Maintainer: Alex Hirzel <alex at hirzel dot us>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Aldeano <aldea.diaguita at gmail dot com>
pkgname=spatialite-tools
pkgver=5.0.0
pkgrel=1
pkgdesc='Set of CLI tools for spatialite'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/spatialite-tools/index'
license=('MPL')
depends=('libspatialite' 'readosm')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('ad092d90ccb2c480f372d1e24b1e6ad9aa8a4bb750e094efdcc6c37edb6b6d32')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
