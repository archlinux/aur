# Maintainer: nandub <dev+arch@nandub.info>
pkgname=primesieve
pkgver=5.4.1
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
source=(http://dl.bintray.com/kimwalisch/primesieve/$pkgname-$pkgver.zip)
sha1sums=('00223de8cd4e0542e085a2cdc60b2f208cd52d6c')
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
