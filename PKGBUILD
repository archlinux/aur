# Maintainer: Brian Galey <bkgaley@gmail.com>
pkgname=readosm
pkgver=1.0.0b
pkgrel=1
pkgdesc='Library to extract valid data from within an Open Street Map input file'
arch=('i686' 'x86_64')
url='https://www.gaia-gis.it/fossil/readosm/index'
license=('MPL')
depends=('expat' 'zlib')
options=('!libtool')
source=("http://www.gaia-gis.it/gaia-sins/$pkgname-sources/$pkgname-$pkgver.tar.gz")
sha256sums=('ed7e0d17fbfc7574b097e2358a143788eba23e0477e7108237f4b0aac3d85710')

build() {
  cd "$srcdir/${pkgname/lib/}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname/lib/}-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
