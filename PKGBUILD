# Maintainer: Alex Hirzel <alex at hirzel dot us>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Aldeano <aldea.diaguita at gmail dot com>
pkgname=spatialite-tools
pkgver=5.0.1
pkgrel=1
pkgdesc='Set of CLI tools for spatialite'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/spatialite-tools/index'
license=('MPL')
depends=('libspatialite' 'readosm')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('9604c205e87f037789bc52302c66ccd1371c3e98c74e8ec4e29b0752de35171c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
