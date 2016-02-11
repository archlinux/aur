# Maintainer: Anatol Pomozov <anatol@google.com>

pkgname=muduo
pkgver=1.0.8
pkgrel=1
pkgdesc='A C++ non-blocking multi-threaded network library'
url='https://github.com/chenshuo/muduo'
license=(BSD)
arch=(i686 x86_64)
depends=(protobuf)
makedepends=(cmake boost)
options=(staticlibs)
source=(muduo-$pkgver.zip::https://github.com/chenshuo/muduo/archive/v$pkgver.zip)
sha1sums=('c30873460d12e601d9d09ae78741b4a00e3725dc')

build() {
  cd muduo-$pkgver
  sed -i '/-Werror/d' CMakeLists.txt
  BUILD_NO_EXAMPLES=1 INSTALL_DIR=/usr ./build.sh
}

package() {
  cd build/release
  make install DESTDIR="$pkgdir"
}
