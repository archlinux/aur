# Maintainer: Brian Galey <bkgaley@gmail.com>
pkgname=readosm
pkgver=1.0.0e
pkgrel=1
pkgdesc='Library to extract valid data from within an Open Street Map input file'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/readosm/index'
license=('MPL')
depends=('expat' 'zlib')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('1fd839e05b411db6ba1ca6199bf3334ab9425550a58e129c07ad3c6d39299acf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
