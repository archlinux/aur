# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=filesystem
pkgname=gulrak-filesystem
pkgver=1.5.14
pkgrel=1
pkgdesc="An implementation of C++17 std::filesystem for C++11/C++14/C++17/C++20)"
arch=(any)
url="https://github.com/gulrak/filesystem"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9734907da65e0f390e461d76c7b1c7e8ffa1a0f7f01e5952d69d9d6b6cc3c85e20f5e4495235f2589635fb665040bf2ee4def4d3bdcb0f3453a00ee8c4e8ac3f')

build() {
  cmake -B build -S $_name-$pkgver \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  cmake --install build
}
