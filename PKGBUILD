# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

_pkgbase=godsvg
pkgname=godsvg-bin
_pkgname=GodSVG
_pkgver=1.0-alpha3
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="An editor for Scalable Vector Graphics (SVG) files. Built with Godot"
arch=(x86_64)
depends=('glibc')
url='https://github.com/MewPurPur/GodSVG'
license=('MIT')
source=(
    "${pkgname}.zip::${url}/releases/download/v${_pkgver}/GodSVG.Linux.zip"
    "LICENSE::${url}/raw/main/LICENSE"
    "${_pkgbase}.png::https://raw.githubusercontent.com/MewPurPur/GodSVG/main/visual/icon.png"
    "${_pkgbase}.desktop"
)
sha256sums=('88593b46782a0d0437e25f91abfe9d4b750ad36eb161126f743b34572e7e327d'
            'a2e1a9795671794be3a25bd921a16f0fa9819ede1ead54a13da6edb34bfc0ee1'
            'c809390a25c9a922a1f122d48492dac8ed32c288df827c5605e86358d84cd1c1'
            '3727b1980d672f7aa92915a1f19b17c9800bef55f82d59002e2265e7d7ffb8d5')

options=(!strip)

package() {
    install -Dm755 "GodSVG.${CARCH}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
    install -Dm644 "${_pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgbase}.png"
}
