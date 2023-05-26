# Maintainer: cclin <cclinet@outlook.com>
pkgname=redis-plus-plus
pkgver=1.3.8
pkgrel=1
pkgdesc='Redis client written in C++'
arch=('x86_64')
url="https://github.com/sewenew/redis-plus-plus"
license=('Apache')
depends=('hiredis' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sewenew/$pkgname/archive/$pkgver.tar.gz")

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DREDIS_PLUS_PLUS_BUILD_STATIC=OFF -DREDIS_PLUS_PLUS_BUILD_TEST=OFF -DREDIS_PLUS_PLUS_CXX_STANDARD=17
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
sha256sums=('ad521b4a24d1591a1564f945ba6370875b501210222e324f398065251df41641')
