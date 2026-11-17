# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mp-sonivoxeas
_pkgname=multiplatform-sonivoxeas
pkgver=2.3.0
pkgrel=1
pkgdesc="Multiplatform Sonivox EAS for Qt"
arch=(x86_64)
url="https://github.com/pedrolcl/${_pkgname}"
license=('GPL-3.0-only')
depends=(drumstick glibc hicolor-icon-theme libgcc libstdc++ qt6-base qt6-multimedia sonivox xdg-utils)
makedepends=(cmake)
source=("https://github.com/pedrolcl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c2f7ae4095a6d3e56bd14a7fb272c8334defbf16f3645d4ee24c4c6a5cd522c')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
