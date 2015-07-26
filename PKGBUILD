# Maintainer: Brian Galey <bkgaley at gmail dot com>
# Contributor: Aldeano <aldea.diaguita at gmail dot com>
pkgname=spatialite-tools
pkgver=4.3.0
pkgrel=1
pkgdesc='Set of CLI tools for spatialite'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/spatialite-tools/index'
license=('MPL')
depends=('libspatialite' 'readosm')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('f739859bc04f38735591be2f75009b98a2359033675ae310dffc3114a17ccf89')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
