# Maintainer: jerry73204 <jerry73204@gmail.com>
# Former Maintainer: Govind Gopakumar < govind.93 at gmail dot com>
# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=1.0.12
pkgrel=1
pkgdesc="a scalable c++ machine learning library"
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('armadillo>=3.6.0' 'boost>=1.49' 'lapack' 'libxml2>=2.6.0')
makedepends=('cmake>=2.8.5' 'txt2man')
source=("http://www.$pkgname.org/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('739ca617b4adb118742c59dd8e15d6ca')

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

