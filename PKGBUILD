# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=melodie-appimage
_pkgname=melodie
pkgver=2.0.0
pkgrel=1
pkgdesc="Melodie is a portable, simple-as-pie music player"
arch=('x86_64')
url="https://github.com/feugy/melodie"
license=('MIT')
conflicts=('melodie')
depends=('zlib')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
  "LICENSE::https://raw.githubusercontent.com/feugy/melodie/main/LICENSE"
  "${_pkgname}.svg::https://github.com/feugy/melodie/raw/main/images/icon-1.svg"
  "${_pkgname}.desktop"
)
sha512sums=('0adfe2d2dec430f748a8cd6a71ff101aa2929c6e3c4e4d34e097158018b700a70bfe4bce3fccb5dcd52cefdda9234442402c656dcc9016ee55e6c386e49a8bee'
            'cc1e5c73b2e93199c16e49f3787b6350027478eb3c07f7b7f59de32b9607e3157736d9f8f3ae6b1bbbb5fdfffb6a73a19092c6b92496bd6d469c29ed16e519ad'
            'fa909bc1c26b0553ad4890d91d86a87d4cba6788ae08dd1f30bd0455dda015b7777dac31984ecb1bc2d022fc2e62648ffa34c3353f0dbc02727862042fb7170d'
            '5f9150179b7cc9a35cae8459193b57365e04490261bd034027002f0876e4755833dd23d051436aa261dedbb854a12907fbb70af2723440e7278f3cf2af07af07')

_install_path="/opt/appimages/"
prepare() {
    chmod a+x ${_pkgname}-${pkgver}-x86_64.AppImage
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-x86_64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
