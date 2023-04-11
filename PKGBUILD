# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="zui-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_githuburl="https://github.com/brimdata/zui"
license=(custom)
providers=(brimdata)
conflicts=("${pkgname%-bin}")
depends=(at-spi2-core python gtk3 alsa-lib nss zlib sh libxrandr libxfixes glibc pango hicolor-icon-theme \
    gcc-libs sqlite libxkbcommon expat libxdamage libx11 libcups glib2 libdrm dbus libxcb libxcomposite \
    cairo nspr mesa libxext)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE.txt")
sha256sums=('81d0aa66ab1a801398498b0e16cc45e381bed0805a4325ff8038a675d3a19e53'
            'e3d24db419fcb44a1dab91f351b8203e74e8501ea11c4be82ad3cc05070cad9f')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
