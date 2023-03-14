# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=keenwrite-bin
_pkgname=keenwrite
pkgver=3.2.0
pkgrel=1
pkgdesc="Free, open-source, cross-platform desktop Markdown text editor with live preview, string interpolation, and math."
arch=('x86_64')
url="https://github.com/DaveJarvis/KeenWrite"
license=(GPL3)
depends=(hicolor-icon-theme gendesk)
options=(!strip)
optdepends=()
provides=()
conflicts=(keenwrite)
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.bin::${url}/releases/download/${pkgver}/${_pkgname}.bin"
    "LICENSE::${url}/raw/main/LICENSE.md"
    "${_pkgname}.svg::${url}/raw/main/docs/logo/logo-original.svg")
sha256sums=('b3be56d3c84b101f092fbde820d4eab11682b142b6c467a3a253f087ac2cc40b'
            '23e144b1e664fc4bf6a9fd0617c8435e96d4c69023223841b872665794caa8ff'
            '06227eca5759dded2d55052673cc2d287b548747d3228dfb0b001efaf9fd14c6')

package() {
    chmod +x "${_pkgname}-${pkgver}.bin"
    mkdir -p "${pkgdir}/opt/apps/${_pkgname}"
    cp "${_pkgname}-${pkgver}.bin" "${pkgdir}/opt/apps/${_pkgname}"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "Markdown text editor with live preview, string interpolation, and math." --icon "${_pkgname}" \
        --categories "Utility;Development" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}-${pkgver}.bin"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
