# Maintainer: cclin <cclinet@outlook.com>
pkgname=redis-plus-plus
pkgver=1.3.5
pkgrel=1
pkgdesc='A C++ client for Redis based on hiredis written in C++ 11 / C++ 17'
arch=('x86_64')
url="https://github.com/sewenew/redis-plus-plus"
license=('Apache')
depends=('gcc-libs' 'hiredis')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sewenew/$pkgname/archive/$pkgver.tar.gz")

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DREDIS_PLUS_PLUS_BUILD_STATIC=OFF -DREDIS_PLUS_PLUS_BUILD_TEST=OFF -DREDIS_PLUS_PLUS_CXX_STANDARD=17
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" PREFIX=/usr install
}
sha256sums=('a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f')
