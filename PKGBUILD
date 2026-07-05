# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-visual-map
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="Visual Map plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-visual-map')
conflicts=('openrgb-plugin-visual-map')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBVisualMapPlugin"
    git submodule update --init --recursive
    qmake OpenRGBVisualMapPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBVisualMapPlugin
    make INSTALL_ROOT="$pkgdir" install
}
