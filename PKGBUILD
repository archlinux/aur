# Maintainer: Joshua Bevan <joshua@acis.net.au>
pkgname=runrat
pkgver=1.0.3
pkgrel=1
pkgdesc="Tray system activity monitor with a running rat"
arch=("x86_64" "aarch64")
url="https://github.com/Lolretrorat/runrat"
license=("MIT")
depends=("gtk3" "libayatana-appindicator")
makedepends=("cmake" "pkgconf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6300a9d7b3acfb5187ada99611b2ca07f809f6f95ae77aab121208ba72032bc3")

build() {
  cmake \
    -S "${srcdir}/${pkgname}-${pkgver}/linux" \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRUNRAT_ENABLE_SOURCE_ICON_DIR=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
