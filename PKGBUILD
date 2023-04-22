# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="swifty-bin"
pkgver=0.6.13
pkgrel=3
pkgdesc="Free Offline-first Password Manager for MacOS, Windows and Linux."
arch=("x86_64")
url="https://getswifty.pro/"
_githuburl="https://github.com/swiftyapp/swifty"
license=('GPL3')
depends=(nss gtk3 at-spi2-core alsa-lib libxkbcommon libxdamage nspr libxfixes glib2 libx11 hicolor-icon-theme \
    libxcomposite libcups pango cairo libxrandr libdrm mesa expat glibc libxext gcc-libs dbus libxcb)
conflit=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/Swifty_${pkgver}_amd64.deb")
sha256sums=('daa037c75ebc4e6a7b0b835f0efef2d5b1fa7bf4c2c728badbeb16d5f61a3b6a')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    rm -r "${pkgdir}/usr/share/icons"
}