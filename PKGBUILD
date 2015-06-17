# Maintainer: Anatol Pomozov <anatol@google.com>

pkgname=muduo
pkgver=0.9.7
pkgrel=1
pkgdesc='A C++ non-blocking multi-threaded network library'
url='https://code.google.com/p/muduo/'
license=('BSD 3 clause')
arch=(i686 x86_64)
depends=(protobuf)
makedepends=(cmake boost)
options=(staticlibs)
source=(https://muduo.googlecode.com/files/muduo-$pkgver-beta.tar.gz)
sha1sums=('20dbfeae1f5e175ed9fe697baf6c96abab4916a2')

build() {
  cd muduo
  # TODO: it should reuse arch compile flags
  BUILD_TYPE=Release BUILD_NO_EXAMPLES=1 INSTALL_DIR=/usr ./build.sh
}

check() {
  cd build/Release
#  make test
}

package() {
  cd build/Release
  make install DESTDIR="$pkgdir"
}
