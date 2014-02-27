# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Adopted by: Govind Gopakumar < govind.93 at gmail dot com>
pkgname=mlpack
pkgver=1.0.8
pkgrel=1
pkgdesc="a scalable c++ machine learning library"
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('armadillo>=3.6.0' 'boost' 'lapack' 'libxml2>=2.6.0')
makedepends=('cmake>=2.8.0' 'txt2man')
source=("http://www.$pkgname.org/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('0331e12f2485b9d5d39c9d9dea618108')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D DEBUG=OFF -D PROFILE=OFF .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make mlpack_test
  bin/mlpack_test
} 

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make install
}

# vim:set ts=2 sw=2 et:
