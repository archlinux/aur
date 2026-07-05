# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-hardware-sync
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="Hardware Sync plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb' 'libgtop')
makedepends=('git')
provides=('openrgb-plugin-hardware-sync')
conflicts=('openrgb-plugin-hardware-sync')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBHardwareSyncPlugin"
    git submodule update --init --recursive
    qmake OpenRGBHardwareSyncPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBHardwareSyncPlugin
    make INSTALL_ROOT="$pkgdir" install
}
