# Maintainer: nandub <nandub+arch@nandub.info>
pkgname=primesieve
pkgver=6.1
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
makedepends=(cmake)
source=(https://github.com/kimwalisch/primesieve/archive/v$pkgver.tar.gz)
sha1sums=('30267fb92592495c1bc1c6a845d553b9758b93e2')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  imake -C $pkgname install
}
