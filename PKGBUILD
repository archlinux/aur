# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=exabayes
pkgver=1.4.1
pkgrel=2
pkgdesc="bayesian tree inference"
arch=(i686 x86_64)
url="http://sco.h-its.org/exelixis/web/software/exabayes/"
license=(GPL3)
depends=(gcc-libs)
#checkdepends=(gtest)
conflicts=(exabayes-mpi)
source=("http://sco.h-its.org/exelixis/material/exabayes/$pkgver/$pkgname-$pkgver-src.tar.gz")
md5sums=('1d49d78705b6dab3b4fa4c602edae21f')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  # buggy as of 1.4.1
  #make test
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
