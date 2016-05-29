# Maintainer: Brian Hood <brianh6854@googlemail.com>

pkgname=r-lang
pkgver=3.1.2
pkgrel=1
pkgdesc="Language R $pkgver"
arch=('i686' 'x86_64')
url="http://www.r-project.org/"
license=('gpl')
makedepends=('gcc-fortran' 'jre7-openjdk-headless')
source=("http://cran.rstudio.com/src/base/R-3/R-$pkgver.tar.gz")
sha1sums=("93809368e5735a630611633ac1fa99010020c5d6")

build() {
  cd "$srcdir/R-$pkgver"
  ./configure --prefix=/usr --enable-R-shlib
  make
}

package() {
  cd "$srcdir/R-$pkgver"
  make "DESTDIR=$pkgdir" install
}
