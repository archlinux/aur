# Maintainer: nandub <dev@nandub.info>
pkgname=primesieve
pkgver=5.2
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
source=(http://dl.bintray.com/kimwalisch/primesieve/$pkgname-$pkgver.zip)
sha1sums=('c587b17c24e4e6a2f9b874e244377bc2db23ded5')
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
