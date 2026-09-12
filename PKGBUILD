# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-scheduler
pkgver=1.0.0
pkgrel=1
pkgdesc="Scheduler plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-scheduler')
conflicts=('openrgb-plugin-scheduler')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin.git#tag=release_1.0")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBSchedulerPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBSchedulerPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSchedulerPlugin
    make INSTALL_ROOT="$pkgdir" install
}
