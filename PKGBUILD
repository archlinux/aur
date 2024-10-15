# Maintainer: huj13k4n9 <huj13k4n9 at qq dot com>
pkgname=ttf-vivo-sans
_pkgname="vivo Sans"
pkgver=2024.10.15
pkgrel=1
pkgdesc="vivo Sans is a global language font led by vivo."
arch=("any")
url='https://www.vivo.com.cn/originos'
license=("LicenseRef-custom")
conflicts=("${pkgname//ttf-/}")
source=(
    "${pkgname}-${pkgver}.zip::https://h5-pre.vivo.com.cn/pcvivo/OS5-font/${_pkgname// /%20}.zip"
)
sha256sums=('5192acc84bc96d017a1a9aaa3be636e1da8561be897ada31e3f14c922d347d56')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm644 "${srcdir}/${_pkgname}/"*/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname//ttf-/}"
    install -Dm644 "${srcdir}/${_pkgname}/vivo Sans字体知识产权许可协议.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
