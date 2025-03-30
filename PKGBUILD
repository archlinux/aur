# Maintainer: Tom Meyers <tom at odex dot be>
# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=tidal-hifi-appimage
pkgver=5.18.2
pkgrel=1
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine"
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
options=(!strip)

_appimage="tidal-hifi-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.AppImage"
        "tidal-hifi.desktop"
        "icon.png")
md5sums=('ac9983ce9101f66111f4edfc5ff1c708'
         '70cda094350ff39796024c3300a5e006'
         'c17104184b4ae7af3b82c0930a22a777')
noextract=("${_appimage}")

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/tidal/${_appimage}"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" "${pkgdir}/usr/share/applications/tidal-hifi.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/tidal-hifi.png"
    install -Dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/tidal/${_appimage}" "${pkgdir}/usr/bin/tidal-hifi"
}
