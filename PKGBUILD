# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stackzy-bin
_pkgname=stackzy
pkgver=1.2.5
pkgrel=1
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=('Apache2')
providers=(theapache64)
options=()
depends=(libxtst libglvnd fontconfig libnet java-runtime libxrender alsa-lib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('26c3727c54db393ca6a6debe72e42551c26f4a850167549159824d9e74d5e59f')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Icon=\/opt\/stackzy\/lib\/Stackzy.png/Icon=stackzy/g;s/Unknown/Utility;Development;/g' -i "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Stackzy.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Stackzy.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/Stackzy.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
