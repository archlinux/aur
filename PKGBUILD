# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearboy"
pkgver=3.4.0
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/releases/download/gearboy-${pkgver}/Gearboy-${pkgver}-Linux.tar.xz")
sha256sums=("3318340ff5788bbe8b3431ad8c64b0345b8f4bf8c83522f599dcea4fb664418c")

package() {
    cd Gearboy-${pkgver}-Linux
    mkdir -p "$pkgdir/opt/gearboy"
    install -Dm755 gearboy "$pkgdir/opt/gearboy"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearboy"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearboy/gearboy" "$pkgdir/usr/bin/gearboy"
}
