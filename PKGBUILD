# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mp-sonivoxeas
_pkgname=multiplatform-sonivoxeas
pkgver=2.1.0
pkgrel=2
pkgdesc="Multiplatform Sonivox EAS for Qt"
arch=(x86_64)
url="https://github.com/pedrolcl/${_pkgname}"
license=('GPL3')
depends=(drumstick qt6-multimedia sonivox)
makedepends=(cmake)
source=("https://github.com/pedrolcl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91cfb33602c833d366b3e51bf00d15bd69d719d397a20a1109aeff2f6422e0e8')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT=6

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
