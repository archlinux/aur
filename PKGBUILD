# Maintainer: cclin <cclinet@outlook.com>
pkgname=redis-plus-plus
pkgver=1.2.1
pkgrel=3
pkgdesc='A C++ client for Redis based on hiredis written in C++ 11 / C++ 17'
arch=('x86_64')
url="https://github.com/sewenew/redis-plus-plus"
license=('Apache')
depends=('gcc-libs' 'hiredis')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sewenew/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DREDIS_PLUS_PLUS_BUILD_STATIC=OFF -DREDIS_PLUS_PLUS_BUILD_TEST=OFF -DREDIS_PLUS_PLUS_CXX_STANDARD=17
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" PREFIX=/usr install
}
sha256sums=('f09c9fcc362955edb887632cd008102887278c94934d7e8c9d0acb8707671902')
