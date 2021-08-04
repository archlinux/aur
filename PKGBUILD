# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-cloud-cpp
pkgver=1.30.0
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('gcc' 'cmake' 'm4')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v$pkgver.tar.gz")
sha256sums=('c98dc3bf0f1a9e2403b438eefa201f4e11d78169dce9add4bf41e7746a11c131')

build() {
  cd "$pkgname-$pkgver"
  cmake \
      -DBUILD_TESTING=OFF \
      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
      -H. -Bcmake-out
  cmake --build cmake-out
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build cmake-out --target install
}
