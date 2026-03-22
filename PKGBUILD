# Maintainer: Jason Scurtu <jscurtu@gmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=plasma6-applets-appgrid
pkgver=1.7.4
pkgrel=1
pkgdesc="A modern fullscreen application launcher for KDE Plasma"
arch=('x86_64')
url="https://github.com/xarbit/plasma6-applet-appgrid"
license=('GPL-2.0-or-later')
depends=(
    'plasma-workspace'
    'kservice'
    'layer-shell-qt'
    'qt6-base'
    'kirigami'
    'kiconthemes'
    'ksvg'
    'glibc'
    'kio'
    'krunner'
    'kdeclarative'
    'qt6-declarative'
    'libstdc++'
    'libgcc'
    'kcoreaddons'
    'kwindowsystem'
    'kcmutils'
    'libplasma'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarbit/plasma6-applet-appgrid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('517bf2ca7b31a189174d9d8aca3777742f420df715ef75c6d4277c398c2de96f')

build() {
    cmake -B build -S "plasma6-applet-appgrid-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
