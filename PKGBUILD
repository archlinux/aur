# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=micropad
pkgver=4.7.0
pkgrel=2
pkgdesc="A powerful note-taking app that helps you organise + take notes without restrictions."
arch=('x86_64')
url="https://getmicropad.com"
license=('MPL2')
depends=(
    'electron44'
)
source=(
    "https://github.com/MicroPad/MicroPad-Electron/releases/download/v${pkgver}-1/${pkgname}-${pkgver}-1.pacman"
    "micropad-bin"
)
sha256sums=('a9b58d87eb3d5029e256a4713470a1d43f9c03513e078c980835e78d0f31f430'
            '746f91c67305ebd32cfebd82531b539f44f5a315052120c1bb1c5adfb65fca62')
install="micropad.install"

package() {
    install -dm755 "$pkgdir/opt/µPad"
    cp -a opt/µPad/resources "$pkgdir/opt/µPad/"
    cp -a usr "$pkgdir/usr"

    # Use system electron
    install -Dm755 "$pkgname-bin" "$pkgdir/opt/µPad/$pkgname"

    # Link to the binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/µPad/micropad "$pkgdir/usr/bin/$pkgname"
}
