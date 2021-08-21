# Maintainer: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs
pkgver=1.3.0
pkgrel=2
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
url='https://github.com/MirServer/wlcs'
arch=(x86_64 i686 aarch64)
license=(GPL)
depends=(gtest boost-libs wayland)
makedepends=(git cmake boost gmock wayland-protocols)
optdepends=()
source=("git+https://github.com/MirServer/wlcs.git")
sha256sums=('SKIP')

BUILD_DIR=build

build() {
  cd "${pkgname}"
  mkdir -p "${BUILD_DIR}"
  cd "${BUILD_DIR}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./
}

package() {
  cd "${pkgname}/${BUILD_DIR}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
