# Maintainer: Brian Galey <bkgaley at gmail dot com>
# Contributor: Aldeano <aldea.diaguita at gmail dot com>
pkgname=spatialite-tools
pkgver=4.2.0
pkgrel=3
pkgdesc='Set of CLI tools for spatialite'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/spatialite-tools/index'
license=('MPL')
depends=('libspatialite' 'readosm')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('890c4cdab5b6b450df4f98341110dd79df20b3cc3af4fecd6e4a06cfc718cdbc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
