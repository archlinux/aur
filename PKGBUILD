# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=exabayes-mpi
pkgver=1.4.1
pkgrel=1
pkgdesc="bayesian tree inference"
arch=(i686 x86_64)
url="http://sco.h-its.org/exelixis/web/software/exabayes/"
license=(GPL3)
depends=(openmpi)
#checkdepends=(gtest)
conflicts=(exabayes)
provides=(exabayes)
source=("http://sco.h-its.org/exelixis/material/exabayes/$pkgver/exabayes-$pkgver-src.tar.gz")
md5sums=('1d49d78705b6dab3b4fa4c602edae21f')

build() {
  cd $srcdir/exabayes-$pkgver

  ./configure --prefix=/usr --enable-mpi

  make
}

check() {
  cd $srcdir/exabayes-$pkgver

  # buggy as of 1.4.1
  #make test
}

package() {
  cd $srcdir/exabayes-$pkgver

  make DESTDIR="$pkgdir" install
}
