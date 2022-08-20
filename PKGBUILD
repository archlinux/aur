# Maintainer: aquova <austinbricker at protonmail dot com>
pkgname="gearcoleco"
pkgver=1.0.0
pkgrel=2
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('glew-2.1' 'sdl2')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("87d1b99173573f2fc1139e068bd332b677862699800531eb747e2c3184e05e2f")

build() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    mkdir -p "$pkgdir/opt/gearcoleco"
    install -Dm755 gearcoleco "$pkgdir/opt/gearcoleco"
    install -Dm644 gamecontrollerdb.txt "$pkgdir/opt/gearcoleco"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/gearcoleco/gearcoleco" "$pkgdir/usr/bin/gearcoleco"
}
