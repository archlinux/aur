# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearsystem"
pkgver=3.4.1
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/releases/download/gearsystem-${pkgver}/Gearsystem-${pkgver}-Linux.tar.xz")
sha256sums=("c5cd5741d1f7ce94a14cb0d2c1523db666b12d31c6ffb292958a097dc9ceace3")

package() {
    cd Gearsystem-${pkgver}-Linux
    mkdir -p "$pkgdir/opt/gearsystem"
    install -Dm755 gearsystem "$pkgdir/opt/gearsystem"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearsystem"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearsystem/gearsystem" "$pkgdir/usr/bin/gearsystem"
}
