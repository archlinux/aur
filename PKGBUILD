# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tilde-podcast-appimage
_pkgname=tilde
pkgver=1.0.0
pkgrel=1
pkgdesc="Podcast client to listen to all you favorite podcasts"
arch=('x86_64')
url="https://github.com/paologiua/tilde"
license=('MIT')
conflicts=()
depends=(zlib hicolor-icon-theme)
options=(!strip)
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Tilde-${pkgver}.AppImage"
  "LICENSE::${url}/raw/main/LICENSE"
  "${pkgname}.png::${url}/raw/main/images/${_pkgname}.png"
  "${pkgname}.desktop"
)
sha512sums=('cc857618d5bd1e8c9d1b929e5f32e102561039f960c4fd213fbeb6c58e4ead1bc6a6654078be9703e41dccc84f41ade76348f9f1e8177792047c09a5886daaba'
            '779a7c307c5d3b375b25bdda6f5c9830385ddc276be0b8a7fb00ef63c6c4dd181cf7f67bfb056a75b865f436ec5f35422340dd3522da956a9ac7d38391100086'
            'd563b75dba483befbe5451c4f9ebabb4c50ab36c3d6ec2fcead153f6c5712d4b61f7c0de227141b6356d6a2b96c9c62c6da7bdddb9298f8e0c40a3539d7d23fa'
            '4c52d7aeb223e3fdf204942b9145a3ec125706054665dbcca82117e56eb2b60fc7997864dac376a1f2d6c43faa3ac63e73b06d573a6bb89ec1efecbf1ebbcd17')
  
_install_path="/opt/appimages/"
prepare() {
    chmod a+x ${_pkgname}-${pkgver}-x86_64.AppImage
}
  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-x86_64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
