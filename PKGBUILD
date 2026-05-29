pkgname=sniffercommit
pkgver=0.3.3
pkgrel=1
pkgdesc="Fast C++20-powered pre-commit hook and CI generator"

arch=('x86_64')

url="https://github.com/slowy07/sniffercommit"
license=('MIT')

depends=(
  'git'
  'bash'
  'fmt'
)

makedepends=(
  'cmake'
  'ninja'
  'clang'
)

source=()

sha256sums=()

build() {
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DSNIFFERCOMMIT_USE_SYSTEM_FMT=ON \
    -DSNIFFERCOMMIT_USE_SYSTEM_TOMLPLUSPLUS=OFF

  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
