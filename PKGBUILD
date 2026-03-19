# Maintainer: Pascal Pollet <paspol@gmx.de>
pkgname=babeleo
pkgver=0.7.1
pkgrel=1
pkgdesc="KDE Plasma 6 applet for quick lookups in translation services or other web services"
arch=('x86_64')
url="https://github.com/tryptophane/babeleo-plasma"
license=('GPL-2.0-or-later')
depends=(
    'plasma-framework'
    'kf6-kcoreaddons'
    'kf6-ki18n'
    'kf6-kconfig'
    'kf6-kglobalaccel'
    'kf6-kio'
    'kf6-kwidgetsaddons'
    'kf6-kxmlgui'
    'kf6-kwindowsystem'
    'qt6-base'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
optdepends=('wl-clipboard: Wayland primary selection (mouse-selected text without Ctrl+C)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tryptophane/babeleo-plasma/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d5f66df926d9b9cafdfd6c6360e48d5fb3578294c8796264fbefc24346a14399')

build() {
    cmake -B build -S "babeleo-plasma-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
