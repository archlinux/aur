# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=keenwrite
pkgname="${_pkgname}-bin"
pkgver=3.2.0
pkgrel=2
pkgdesc="Free, open-source, cross-platform desktop Markdown text editor with live preview, string interpolation, and math."
arch=('x86_64')
url="https://github.com/DaveJarvis/KeenWrite"
license=(GPL3)
depends=(hicolor-icon-theme gendesk)
options=(!strip)
provides=(DaveJarvis)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/${pkgver}/${_pkgname}.bin"
    "LICENSE::${url}/raw/main/LICENSE.md"
    "${_pkgname}.svg::${url}/raw/main/docs/logo/logo-original.svg")
sha256sums=('b3be56d3c84b101f092fbde820d4eab11682b142b6c467a3a253f087ac2cc40b'
            '4b3ac81a7b14c015809f784bcd33f9c84c5ce5230626965274856d73042b1db7'
            '06227eca5759dded2d55052673cc2d287b548747d3228dfb0b001efaf9fd14c6')

package() {
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}.bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "Markdown text editor with live preview, string interpolation, and math." --icon "${_pkgname}" \
        --categories "Utility;Development" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}.bin"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}