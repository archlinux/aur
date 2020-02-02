# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=cppfs
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform C++ file system library supporting multiple backends"
url="https://github.com/cginternals/cppfs"
arch=(x86_64)
license=('MIT')
makedepends=(cmake gcc)
depends=()
optdepends=(cppcheck)
source=("https://github.com/cginternals/cppfs/archive/v$pkgver.tar.gz")
sha256sums=("6d1b84490d02b85473d627dcdbe491a615f3c75e25da9d7c32a7825e168242e5")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
