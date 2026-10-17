# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-skin
pkgver=1.0
pkgrel=1
pkgdesc="Skin plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSkinPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-skin')
conflicts=('openrgb-plugin-skin')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSkinPlugin.git#tag=release_1.0")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBSkinPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBSkinPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSkinPlugin
    make INSTALL_ROOT="$pkgdir" install
}
