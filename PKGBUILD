# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearcoleco"
pkgver=1.0.0
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/releases/download/${pkgver}/Gearcoleco-${pkgver}-Linux.tar.xz")
sha256sums=("67739a98858af16465374e3667a3a6d8a8eb587d3cf83c82e4f25f3ed667ee24")

package() {
    cd Gearcoleco-${pkgver}-Linux
    mkdir -p "$pkgdir/opt/gearcoleco"
    install -Dm755 gearcoleco "$pkgdir/opt/gearcoleco"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearcoleco"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearcoleco/gearcoleco" "$pkgdir/usr/bin/gearcoleco"
}
