# Maintainer: Dmitriy Q krotesk<at>mail<dot>ru

pkgname=ydisk_commander
pkgver=1.0
pkgrel=2
pkgdesc="Yandex Disk plugin for Double Commander."
arch=("x86_64")
url="https://github.com/ivanenko/ydisk_commander/"
license=("GPL2")
depends=("doublecmd")
makedepends=("cmake")
source=(https://github.com/ivanenko/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4dd7fc01825ff3eb46ec505d672d44cbde931f67233ca5489fcf9bef637d112c')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir build
    cmake -S . -B ./build
    cmake --build ./build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m0644 ./build/${pkgname}.wfx $pkgdir/usr/lib/doublecmd/plugins/wfx/${pkgname}/${pkgname}.wfx
#    cp ./build/${pkgname}.wfx $pkgdir/usr/lib/doublecmd/plugins/wfx/${pkgname}/${pkgname}.wfx
}
