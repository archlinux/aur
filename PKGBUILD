# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tfiletransfer-bin"
_appname="tFileTransfer"
pkgver=2.2.1
pkgrel=1
pkgdesc="Desktop application to transfer/share files, support Windows, Linux and MacOS."
arch=('x86_64')
url="https://github.com/Tans5/tFileTransfer_desktop"
license=('Apache')
depends=('libxext' 'fontconfig' 'libxi' 'libx11' 'alsa-lib' 'libglvnd' 'glibc' 'libxtst' 'libxrender' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('949d4f774f79f03ed44bdca7cf3d6a8bee3d8c1a096e367f2dfc4161dca8d3cd')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${_appname}.png" "${pkgdir}/usr/share/pixmaps"
    sed "s|Icon=/opt/${pkgname%-bin}/lib/${_appname}.png|${pkgname%-bin}|g;s|未知|Utility;|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}