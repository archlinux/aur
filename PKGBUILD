# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=1.0.5
pkgrel=1
pkgdesc="a scalable c++ machine learning library"
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3+')
depends=('armadillo>=2.4.0' 'boost' 'lapack' 'libxml2')
makedepends=('cmake>=2.8.0' 'txt2man')
source=("http://www.$pkgname.org/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('f3ae9ed8c85983aa3a5cf8878ec4a5d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/" -D DEBUG=OFF -D PROFILE=OFF .
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
