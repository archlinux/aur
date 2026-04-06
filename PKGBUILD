# Maintainer: Pascal Pollet <paspol@gmx.de>
pkgname=babeleo
pkgver=0.10.0
pkgrel=1
pkgdesc="KDE Plasma 6 applet for quick lookups in translation services or other web services"
arch=('x86_64')
url="https://github.com/tryptophane/babeleo-plasma"
license=('GPL-2.0-or-later')
depends=(
    'libplasma'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'kglobalaccel'
    'kio'
    'kwidgetsaddons'
    'kxmlgui'
    'kwindowsystem'
    'qt6-base'
    'wl-clipboard'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tryptophane/babeleo-plasma/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d28c490795d55b3129c7572fc40c7af10b83ed3e8ca3b382a3284922fa4db48')

build() {
    cmake -B build -S "babeleo-plasma-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
