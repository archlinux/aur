# Maintainer: nandub <nandub+arch@nandub.info>
pkgname=primesieve
pkgver=7.0
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://primesieve.org/"
license=("BSD")
depends=(gcc-libs)
makedepends=(cmake)
source=(https://github.com/kimwalisch/primesieve/archive/v$pkgver.tar.gz)
sha1sums=('08998030d3fac328c3f467cf50507e40561c7f2a')
arch=('i686' 'x86_64')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}
