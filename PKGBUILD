# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lutris-formatfactory-spark
_pkgname=com.sugarcane.formatfactory
pkgver=5.7.5.1
pkgrel=1
epoch=
pkgdesc="the world's advanced video and image format conversion client"
arch=("x86_64")
url="http://www.pcgeshi.com/index.html"
license=('custom')
depends=(
  bash
  hicolor-icon-theme
    )
optdepends=( )
conflicts=()
provides=("PCGESHI")
install=
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('9e7c1c55b374ece7432398c3dd02491937dfd60e500ac79d414c9555180d70da')

prepare() {
    bsdtar -xf data.tar.xz
    sed '10,$d' -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Categories=AudioVideo;" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
  
package() {
    cp --parents -a {opt,usr/share} "${pkgdir}"
}
