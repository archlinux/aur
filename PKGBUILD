# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-douyin
_pkgname=com.douyin.spark
pkgver=1.7.1
sparkver=1.7.1spark2
pkgrel=1
epoch=
pkgdesc="douyin,record beautify life"
arch=("x86_64")
url="https://www.douyin.com/"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=( )
conflicts=()
provides=("douyin")
install="deepin-wine-douyin.install"
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb")
sha256sums=('ddb6e863b45e4eddee273119866e73de27b10efa5e57054933153fb442f1ce10')

prepare() {
    bsdtar -xf data.tar.xz
    sed 's/Video/AudioVideo/g' -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
   
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
}
