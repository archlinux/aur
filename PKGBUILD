# Maintainer: cclin <cclinet@outlook.com>
pkgname=redis-plus-plus
pkgver=1.3.15
pkgrel=1
pkgdesc='Redis client written in C++'
arch=('x86_64')
url="https://github.com/sewenew/redis-plus-plus"
license=('Apache-2.0')
depends=('hiredis' 'glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sewenew/$pkgname/archive/$pkgver.tar.gz")

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DREDIS_PLUS_PLUS_BUILD_STATIC=OFF -DREDIS_PLUS_PLUS_BUILD_TEST=OFF -DREDIS_PLUS_PLUS_CXX_STANDARD=17
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
sha256sums=('e9288fda74f1501c62dd9ab7d6a8dc67de51aa4d5b7c71770baa51987a945941')
