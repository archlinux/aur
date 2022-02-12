# Maintainer: Brian Galey <bkgaley@gmail.com>
pkgname=readosm
pkgver=1.1.0a
pkgrel=1
pkgdesc='Library to extract valid data from within an Open Street Map input file'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/readosm/index'
license=('MPL')
depends=('expat' 'zlib')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('db7c051d256cec7ecd4c3775ab9bc820da5a4bf72ffd4e9f40b911d79770f145')

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
