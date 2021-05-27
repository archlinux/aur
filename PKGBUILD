# Maintainer: Alexander Nortung <alex underscore nortung at live dot dk>

pkgname=oxen-gui-wallet-appimage
pkgver=1.6.0
pkgrel=1
pkgdesc="Oxen electron GUI wallet"
arch=('x86_64')
depends=('zlib' 'gtk2' 'xdg-utils')

url="https://github.com/oxen-io/oxen-electron-gui-wallet"

license=('BSD')

#provides=('oxen-gui-wallet')

_bin="oxen-electron-wallet-${pkgver}-linux.AppImage"

source=("https://github.com/oxen-io/oxen-electron-gui-wallet/releases/download/v${pkgver}/${_bin}")
sha256sums=('246db6b8b1fc09b49741246ecc5a7a8342797d5f29ba9bacba2e099b185b896d')

options=('!strip')

package() {
    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/oxen-gui-wallet/${_bin}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/oxen-gui-wallet/${_bin}" "${pkgdir}/usr/bin/oxen-gui-wallet"
}
