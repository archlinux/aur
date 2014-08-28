# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Adopted by: Govind Gopakumar < govind.93 at gmail dot com>
pkgname=mlpack
pkgver=1.0.9
pkgrel=1
pkgdesc="a scalable c++ machine learning library"
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('armadillo>=3.6.0' 'boost' 'lapack' 'libxml2>=2.6.0')
makedepends=('cmake>=2.8.0' 'txt2man')
source=("http://www.$pkgname.org/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('d32b7e3f3366e8ff06094853251f7710 ')

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

