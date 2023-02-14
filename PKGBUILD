# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-bandizip
_pkgname=com.deepin.bandizip
pkgver=7.23
pkgrel=1
epoch=
pkgdesc="Bandizip is a powerful archiver which provides an ultrafast processing speed and convenient features. 
            Available free of charge, and its paid editions support a variety of advanced features."
arch=("x86_64")
url="http://www.bandisoft.com/bandizip/"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'xdg-utils'
    )
optdepends=( )
conflicts=()
provides=("BANDISOFT")
install=
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('e8f04a4870dbd7e4398b8d3a92a19f451b8756df58f30cdd8cbc0b2bdf629b7a')
  
prepare() {
    bsdtar -xf data.tar.xz
    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
  
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/160x160/apps/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/160x160/apps/${_pkgname}.png
}
