# Maintainer: 0xall3x <ghost.security102@passinbox.com>
pkgname=eppie-bin
_realver=1.2.0-preview
pkgver=1.2.0_preview
pkgrel=1
pkgdesc="Decentralized P2P email client"
arch=("x86_64")
options=(!strip)
url="https://github.com/Eppie-io/Eppie-App"
license=("Apache-2.0")
provides=("eppie")
conflicts=("eppie")
source=("https://github.com/Eppie-io/Eppie-App/releases/download/v${_realver}/eppie.desktop-linux-x64.tar.gz"
        "eppie.desktop")
sha256sums=('fc35a260855691f290af40e2d864e9b4f58f2c9cddb948f79abd55ef0c9540cf'
            '8a3652439cf925acb74b91952b83fb9169ded8d2e7369fde17e32c42e04e629f')

package() {
    install -d "${pkgdir}/opt/eppie" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    cp -a "${srcdir}/"* "${pkgdir}/opt/eppie/"
    rm -f "${pkgdir}/opt/eppie/eppie.desktop"
    ln -s "/opt/eppie/Eppie" "${pkgdir}/usr/bin/eppie"
    install -Dm644 "${srcdir}/eppie.desktop" "${pkgdir}/usr/share/applications/eppie.desktop"
    install -Dm644 "${pkgdir}/opt/eppie/Assets/Icons/iconLogo.targetsize-256.png" "${pkgdir}/usr/share/pixmaps/eppie.png"
}
