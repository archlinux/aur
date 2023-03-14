# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glyphr-studio-desktop-bin
_pkgname=glyphr-studio-desktop
pkgver=0.5.6
pkgrel=1
pkgdesc="A desktop client for Glyphr Studio built in electron.Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="https://www.glyphrstudio.com/"
_githuburl="https://github.com/glyphr-studio/Glyphr-Studio-Desktop"
license=('GPL3')
depends=(libxss at-spi2-core gtk3 alsa-lib nss)
options=()
optdepends=()
provides=("glyphr-studio")
conflicts=('glyphr-studio-desktop')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('ebdd7da4928699cf083c88417b5f105932cdf382f52f12205749a10f9d744097')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}