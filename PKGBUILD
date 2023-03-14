# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kahla
pkgname="${_pkgname}-bin"
pkgver=4.5.0
pkgrel=1
pkgdesc="Kahla is a cross-platform business messaging app."
arch=("x86_64")
url="https://www.kahla.app/"
_githuburl="https://github.com/AiursoftWeb/Kahla.App"
license=('MIT')
depends=(at-spi2-core gtk3 nss alsa-lib libxss)
options=()
optdepends=()
provides=("AiursoftWeb")
conflicts=('kahla')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('129ffc6ea2f046222c0a3bc561572cc0e8880c0150815e3d25b1fb90fb33a472')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Utility/Network/g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}