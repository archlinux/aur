# Maintainer: Anatol Pomozov <anatol@google.com>

pkgname=muduo
pkgver=1.0.7
pkgrel=1
pkgdesc='A C++ non-blocking multi-threaded network library'
url='https://github.com/chenshuo/muduo'
license=(BSD)
arch=(i686 x86_64)
depends=(protobuf)
makedepends=(cmake boost)
options=(staticlibs)
source=(muduo-$pkgver.zip::https://github.com/chenshuo/muduo/archive/v1.0.7.zip)
sha1sums=('b37881ba54a59d1847560aa2b1bdcd2e8250a35c')

build() {
  cd muduo-$pkgver
  BUILD_NO_EXAMPLES=1 INSTALL_DIR=/usr ./build.sh
}

package() {
  cd build/Release
  make install DESTDIR="$pkgdir"
}
