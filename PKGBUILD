# Maintainer: nandub <nandub+arch@nandub.info>
pkgname=primesieve
pkgver=5.6.0
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
source=(http://dl.bintray.com/kimwalisch/primesieve/$pkgname-$pkgver.tar.gz)
sha1sums=('86d0fb98c7e1d6bc47e1923138de3d0c0eb4904c')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
