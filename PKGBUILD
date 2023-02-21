# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
pkgver=2.4.8.198
pkgrel=1
pkgdesc="The Input Method Developed by thunisoft"
providers="thunisoft"
arch=('x86_64')
url="https://pinyin.thunisoft.com"
license=('unknown')
conflicts=()
depends=(
    'cairo'
    'libxtst'
    'qt5-svg'
    'fcitx'
    'fcitx-qt5'
)
options=()
source=(
  "${pkgname}_${pkgver}.deb::https://pinyin.thunisoft.com/webapi/v1/downloadSetupFile?os=uos&cpu=x86"
)
sha512sums=('37b827751e0549cd6eda47b10902dd527550ce9674fc278940ff6f70cafd83349a9a3e9d2934894605cc6364ecf8c62e65a3de7f5a14e200288d9581aa56a814')
  
prepare() {
    bsdtar -xvf data.tar.xz
    mv "${srcdir}/usr/lib/x86_64-linux-gnu/fcitx" "${srcdir}/usr/lib/"
    rmdir "${srcdir}/usr/lib/x86_64-linux-gnu"
    rm -r "${srcdir}/opt/apps/com.thunisoft.input/info"
}
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}
