# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-unbounded-sans
_pkgname=UnboundedSans
pkgver=1.100
pkgrel=1
pkgdesc="无界黑-本字型是在 Dela Gothic One 的基础上补上简化字和简体中文常用字符。目前本字体支援 GB/T 2312 及元素周期表的元素名称。"
arch=('any')
url='https://www.maoken.com/unbound'
_githuburl='https://github.com/maoken-fonts/unbounded-sans'
license=('OFL-1.1')
conflicts=(
    "${pkgname//ttf-/}"
    "${pkgname}"
)
source=(
    "${pkgname}-regular-${pkgver}.ttf::https://raw.githubusercontent.com/maoken-fonts/unbounded-sans/v${pkgver}/fonts/UnboundedSans-Regular.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/unbounded-sans/v${pkgver}/OFL.txt"
)
sha256sums=('d37d10dbb85c7403b164a4565e4e2c837cbbb10005ec812a721104600fc9686d'
            'eb01489da86293bac8dc8c6f046a4b6364991278d9c8afaafb2b7374e6d04e1a')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/${pkgname}-regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm444 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}