# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kahla
pkgname="${_pkgname}-bin"
pkgver=4.5.0
pkgrel=2
pkgdesc="Kahla is a cross-platform business messaging app."
arch=("x86_64")
url="https://www.kahla.app/"
_githuburl="https://github.com/AiursoftWeb/Kahla.App"
license=('MIT')
depends=(at-spi2-core gtk3 nss alsa-lib libxss libxcursor libxrender libcups libxtst libxext cairo gcc-libs nspr libxi \
    pango libx11 hicolor-icon-theme dbus libxfixes libxrandr libxcb libxcomposite glib2 expat gdk-pixbuf2 libxdamage glibc)
options=()
optdepends=()
provides=("AiursoftWeb")
conflicts=('kahla')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('937672471cd111e8136d819db3e59707d97356c02585b88fca84beab46c8209b'
            '97786a931c09198121c83cff3d20f8dae95c96730cb7afbd7393b26ba0654133')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Utility/Network/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}