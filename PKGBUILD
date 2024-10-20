# Maintainer: huj13k4n9 <huj13k4n9 at qq dot com>
pkgname=ttf-vivo-sans
_pkgname="vivo Sans"
pkgver=2024.10.20
pkgrel=1
pkgdesc="vivo Sans is a global language font led by vivo."
arch=("any")
url='https://www.vivo.com.cn/originos'
license=("LicenseRef-custom")
conflicts=("${pkgname//ttf-/}")
source=(
    "${pkgname}-${pkgver}.zip::https://h5-pre.vivo.com.cn/pcvivo/OS5-font/${_pkgname// /%20}.zip"
)
sha256sums=('aba516deb1f7dc4da451e443e284cdf888b7ea4ee61158e928a4ffb6c24eaa11')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    find ${srcdir} -iname \v*ttf -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF/" \;
    install -Dm644 "${srcdir}/${_pkgname}/vivo Sans字体知识产权许可协议.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
