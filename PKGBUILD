# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=micropad
pkgver=3.21.1
pkgrel=1
pkgdesc="A powerful note-taking app that helps you organise + take notes without restrictions."
arch=('x86_64')
url="https://getmicropad.com"
license=('MPL2')
depends=(
	'electron>=6.0.0'
)
source=(
    "https://github.com/MicroPad/Electron/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman"
    "micropad-bin"
)
md5sums=(
    '012ef6f7e01d70f919bf44d2e29d2025'
    '52be1867031e5fad9428138cdb6d027e'
)
install="micropad.install"

package() {
    # Replace bundled binary to use the community electron package
    chmod +x "${srcdir}/micropad-bin"
    cp "${srcdir}/micropad-bin" opt/µPad/micropad

    mv opt "${pkgdir}/opt"
    mv usr "${pkgdir}/usr"
}
