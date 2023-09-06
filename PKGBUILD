# Maintainer: Alex Hirzel <alex at hirzel dot us>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Aldeano <aldea.diaguita at gmail dot com>
pkgname=spatialite-tools
pkgver=5.1.0a
pkgrel=1
pkgdesc='Set of CLI tools for spatialite'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/spatialite-tools/index'
license=('MPL')
depends=('libspatialite' 'readosm')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('119e34758e8088cdbb43ed81b4a6eaea88c764b0b7da19001a5514b2545501ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
