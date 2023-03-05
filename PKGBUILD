# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fcitx-huayupinyin
pkgver=2.4.8.198
pkgrel=2
pkgdesc="The Input Method Developed by thunisoft"
providers="thunisoft"
arch=('x86_64')
url="https://pinyin.thunisoft.com"
license=('unknown')
conflicts=()
depends=('libxtst' 'qt5-svg' 'fcitx' 'fcitx-qt5')
options=()
source=("${pkgname}_${pkgver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.thunisoft.input/com.thunisoft.input_2.4.8.198_amd64.deb")
sha512sums=('37b827751e0549cd6eda47b10902dd527550ce9674fc278940ff6f70cafd83349a9a3e9d2934894605cc6364ecf8c62e65a3de7f5a14e200288d9581aa56a814')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/fcitx" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
    rm -r "${pkgdir}/opt/apps/com.thunisoft.input/info"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
