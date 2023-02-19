# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-appimage
_pkgname=freac
pkgver=continuous
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org/"
license=('GPL2')
conflicts=('freac' 'freac-git')
depends=(zlib hicolor-icon-theme)
options=(!strip)
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/enzo1982/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage"
  "LICENSE::https://github.com/enzo1982/${_pkgname}/raw/master/COPYING"
  "${pkgname}.svg::https://github.com/enzo1982/freac/raw/master/icons/freac.svg"
  "${pkgname}.desktop"
)
sha512sums=('1b5ffb730c18c8e9acf79e9593c4fc8631ee23c0b39e231026a6e508317a65a5c3fce6938cde5edbace87ff1df4b4f096d36972197bab7c77e5742f318e453c0'
            'a9a38208c625452f7e05b5a7e18721ab291e96577c61e14391c5344e7a367e791c787b8dc4c152b82b5694e2523b99f7a0538c6978e303efbee1c12a85fd7eed'
            '0d06a98eea72e8bc08a5502dfd9338538091170dea4e09d9a2dc65de4871c7b5595cb85a8c7ac6b7eab4fc94ba2b7a5e3ce093e11dca6931a95dc7e9407632eb'
            'f6d152a3887aa6526485782b5ca59aa930f2fad4e4bc726f7438a2f2410b58c693372896e739f91366a72e752959f82b8eb72f2867504d98d5c1f18677014c3f')
 
_install_path="/opt/appimages/"
prepare() {
    chmod a+x ${_pkgname}-${pkgver}-x86_64.AppImage
}
 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-x86_64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
