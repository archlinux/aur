# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-appimage
_pkgname=freac
pkgver=1.1.6
pkgrel=3
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org/"
_githuburl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=('freac')
provides=('freac')
depends=(zlib hicolor-icon-theme)
options=(!strip)
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage"
  "LICENSE::${_githuburl}/raw/master/COPYING"
  "${pkgname}.svg::${_githuburl}/raw/master/icons/freac.svg"
  "${pkgname}.desktop"
)
md5sums=('13ae29576120712bcbd7c1a39b441745'
         '4d699aa6a6c6b7bebeadeb886de76e55'
         '9c7d78a4f879a7ccba7ceb1013aaef00'
         '5c72bba204ba9f38e584e7618e7b15e3')
 
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
