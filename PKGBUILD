# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=graphclust
pkgver=0.7.6
pkgrel=2
pkgdesc="structural clustering of RNA sequences"
arch=('x86_64' 'i686')
url="http://www.bioinf.uni-freiburg.de/Software/GraphClust/"
license=('GPL3')
depends=('infernal>=1.0.2' 'infernal<1.1' 'rnaz' 'rnashapes' 'zlib' 'cmfinder')
source=("http://www.bioinf.uni-freiburg.de/Software/GraphClust/GraphClust-$pkgver.tar.gz")
md5sums=('e8a2a0ad87a36accc0bbcfac09b4ff78')

build() {
  cd "$srcdir/GraphClust-$pkgver"

  ./configure --prefix=/usr \
              --disable-static

  make
}

check() {
   cd "$srcdir/GraphClust-$pkgver"

   make check
}

package() {
  cd "$srcdir/GraphClust-$pkgver"

  make DESTDIR="$pkgdir" install
}
