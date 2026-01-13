# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mp-sonivoxeas
_pkgname=multiplatform-sonivoxeas
pkgver=2.2.0
pkgrel=1
pkgdesc="Multiplatform Sonivox EAS for Qt"
arch=(x86_64)
url="https://github.com/pedrolcl/${_pkgname}"
license=('GPL3')
depends=(drumstick qt6-multimedia sonivox)
makedepends=(cmake)
source=("https://github.com/pedrolcl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ceccdf8037caa9cdde4c5bb3802aca6da2f284de7f09e438f49123b7e2c667c')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
