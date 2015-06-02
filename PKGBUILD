# Maintainer: nandub <dev+arch@nandub.info>
pkgname=primesieve
pkgver=5.4.2
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
source=(http://dl.bintray.com/kimwalisch/primesieve/$pkgname-$pkgver.tar.gz)
sha1sums=('4a80f06e0892d1804b83970ed598fd2db564d95e')
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
