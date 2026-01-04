# Maintainer: Blossom OS Team
pkgname=kwin-pen-cursor
pkgver=1.0
pkgrel=1
pkgdesc="Custom cursor overlay for pen tablets on KDE Plasma 6 (KWin Wayland)"
arch=('x86_64')
url="https://codeberg.org/BlossomOS/kwin-pen-cursor"
license=('MIT')
depends=(
    'kwin'
    'qt6-base'
    'qt6-svg'
    'kcoreaddons'
    'kconfig'
    'kconfigwidgets'
    'kcmutils'
    'kio'
    'libxcb'
    'xcb-util-cursor'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/BlossomOS/kwin-pen-cursor/archive/${pkgver}.tar.gz")
sha256sums=('ce6fc6932eb3b559a86608cdda8d0a741a920352a044837e354f0c59667e9d64')

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
