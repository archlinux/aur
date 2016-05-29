# Maintainer: Brian Hood <brianh6854@googlemail.com>

pkgname=r-lang
pkgver=3.3.0
pkgrel=1
pkgdesc="Language R $pkgver"
arch=('i686' 'x86_64')
url="http://www.r-project.org/"
license=('gpl')
makedepends=('gcc-fortran' 'jre8-openjdk-headless')
source=("http://cran.rstudio.com/src/base/R-3/R-$pkgver.tar.gz")
sha256sums=("9256b154b1a5993d844bee7b1955cd49c99ad72cef03cce3cd1bdca1310311e4")

build() {
  cd "$srcdir/R-$pkgver"
  ./configure --prefix=/usr --enable-R-shlib --with-x=no
  make
}

package() {
  cd "$srcdir/R-$pkgver"
  make "DESTDIR=$pkgdir" install
}
