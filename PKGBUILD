# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-scheduler
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="Scheduler plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-scheduler')
conflicts=('openrgb-plugin-scheduler')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBSchedulerPlugin"
    git submodule update --init --recursive
    qmake OpenRGBSchedulerPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSchedulerPlugin
    make INSTALL_ROOT="$pkgdir" install
}
