# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-e131-receiver
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="E1.31 Receiver plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-e131-receiver')
conflicts=('openrgb-plugin-e131-receiver')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBE131ReceiverPlugin"
    git submodule update --init --recursive
    qmake OpenRGBE131ReceiverPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBE131ReceiverPlugin
    make INSTALL_ROOT="$pkgdir" install
}
