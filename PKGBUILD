# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=wangle
pkgver=2017.03.20.00
pkgrel=1
pkgdesc="A full featured, high performance C++ futures implementation"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wangle"
license=('Apache')
depends=('folly' 'boost' 'boost-libs')
makedepends=('cmake' 'gflags' 'gtest' 'google-glog')
options=('!emptydirs' 'staticlibs')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('36519236badf050403f89f3a0b422b64')

build() {
  cd "$pkgname-$pkgver/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

#check() {
#  cd "$pkgname-$pkgver/$pkgname"
#  ctest
#}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  make DESTDIR=$pkgdir install 
}

