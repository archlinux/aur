# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail.com>

pkgname=mopac7
pkgver=1.15
pkgrel=1
url="http://www.bioinformatics.org/ghemical/ghemical/"
license=("GPL")
pkgdesc="Computational chemistry library, that provides function to ghemical"
arch=(i686 x86_64)
depends=('gcc-fortran')
source=("http://bioinformatics.org/ghemical/download/release20111012/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('7e509fd03154b37cc682593365c233f4')
