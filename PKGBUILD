# Maintainer: Yi donghoon <icq4ever@gmail.com>
pkgname=protokol-bin
_pkgname=protokol
pkgver=0.6.5.136
pkgrel=1
pkgdesc="Free OSC, MIDI and Gamepad monitoring app by Hexler"
arch=('x86_64')
url="https://hexler.net/protokol"
license=('custom:Hexler-EULA')
depends=('glibc' 'gcc-libs' 'alsa-lib')
provides=('protokol')
conflicts=('protokol')
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::https://hexler.net/pub/protokol/${_pkgname}-${pkgver}-linux-x64.zip"
        "${_pkgname}.svg::https://hexler.net/site/images/logos/hexler_logo-white.svg"
        "${_pkgname}.desktop"
        "LICENSE")
sha256sums=('fc68d6eb6f7fed716051c2b20e2cf4b173bee2b82e0dbc4642d01190a78731c1'
            '55b858abcb46d071d8a014b9d410dd282bc539b7e29aef0363c9a4f11e0d52c8'
            'SKIP'
            'SKIP')
noextract=()

package() {
    install -Dm755 "${srcdir}/Protokol" "${pkgdir}/opt/${_pkgname}/Protokol"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/Protokol" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
