# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-effects
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="Effects plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb' 'openal')
makedepends=('git')
provides=('openrgb-plugin-effects')
conflicts=('openrgb-plugin-effects')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBEffectsPlugin"
    git submodule update --init --recursive
    qmake OpenRGBEffectsPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBEffectsPlugin
    make INSTALL_ROOT="$pkgdir" install
}
