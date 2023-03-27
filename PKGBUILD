# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=zui
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=2
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_githuburl="https://github.com/brimdata/zui"
license=(custom)
providers=(brimdata)
conflicts=("${_pkgname}")
depends=(at-spi2-core python gtk3 alsa-lib nss zlib sh libxrandr libxfixes glibc pango hicolor-icon-theme \
    gcc-libs sqlite libxkbcommon expat libxdamage libx11 libcups glib2 libdrm dbus libxcb libxcomposite \
    cairo nspr mesa libxext)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE.txt")
sha256sums=('4088e97f708351c2d2d9150bd2f7aa4f1a01ce2a6a407e8c1ca0db15af5e1056'
            '33ce5f6786afd6ab52da7ba3ebe425d67bd3dc892a527ae6ce8e5705479f7dd7')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}