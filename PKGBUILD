# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-http-hook
pkgver=1.0.0.rc2
pkgrel=1
pkgdesc="HTTP Hook plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-http-hook')
conflicts=('openrgb-plugin-http-hook')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin.git#tag=release_candidate_1.0rc2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/OpenRGBHttpHookPlugin"
    git submodule update --init --recursive
    qmake OpenRGBHttpHookPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBHttpHookPlugin
    make INSTALL_ROOT="$pkgdir" install
}
