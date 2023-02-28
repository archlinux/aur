# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swifty-bin
_pkgname=swifty
pkgver=0.6.13
pkgrel=1
pkgdesc="Free Offline-first Password Manager for MacOS, Windows and Linux."
arch=("x86_64")
url="https://github.com/swiftyapp/swifty"
license=('GPL3')
depends=(nss gtk3 at-spi2-core alsa-lib)
conflit=(swifty swifty-appimage)
provides=()
options=()
source=("${_pkgname}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Swifty_${pkgver}_amd64.deb")
sha256sums=('daa037c75ebc4e6a7b0b835f0efef2d5b1fa7bf4c2c728badbeb16d5f61a3b6a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    rm -r "${pkgdir}/usr/share/icons/hicolor/0x0"
}
