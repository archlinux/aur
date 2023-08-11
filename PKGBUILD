# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechesscontrol-bin
_pkgname=ChineseChessControl
_appname="org.Rabbit.${_pkgname%Control}"
pkgver=2.0.11
pkgrel=2
pkgdesc="中国象棋控件,包括中国象棋 MFC 扩展库，中国象棋 activex 控件,中国象棋Qt插件,人工智能引擎等"
arch=("x86_64")
url="https://github.com/KangLin/ChineseChessControl"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('openssl' 'sh' 'qt5-multimedia' 'gcc-libs' 'glibc' 'qt5-base' 'qt5-webengine')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_Linux_${CARCH}_setup.deb")
sha256sums=('af81a3bc853c3d5a26ba1ef6b23a25f0c65ce7fca5affe66ee8619b66c796bf6')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${pkgdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}