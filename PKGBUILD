# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listera-novelreader-bin
pkgver=1.2.1
pkgrel=3
pkgdesc="A txt Chinese novel reader, developed based on Qt5 and Dtk5.一个 txt 中文小说阅读器，基于 Qt5 和 Dtk5 开发。"
arch=('x86_64')
url="https://www.listera.top/tag/novelreader"
_giteeurl="https://gitee.com/lidanger/listera-novelreader"
license=('GPL3')
conflicts=()
depends=('hicolor-icon-theme' 'dtkwidget' 'dtkcore' 'glibc' 'gcc-libs' 'qt5-base' 'dtkgui')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::${_giteeurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-3_amd64.deb"
)
sha256sums=('74fda48d298a908db84ba2f945c2d72cfc3a8eb7ee4696a3f619f1060dd78ef7')
package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    mkdir -p "${pkgdir}/opt/${pkgname%-bin}"
    mv "${pkgdir}/usr/bin/${pkgname%-bin}" "${pkgdir}/opt/${pkgname%-bin}"
    rm -rf "${pkgdir}/usr/bin"
    sed 's|/usr/bin/|/opt/listera-novelreader|g;s|Viewer;Text;Reader;Novel;|Utility;|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}