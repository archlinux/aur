# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-bobohei
pkgver=1.710
pkgrel=1
pkgdesc="来自荆南字坊的免费手写字.Kingnam Bobohei 荆南波波黑"
arch=("any")
url='https://github.com/maoken-fonts/KNBobohei'
license=("OFL-1.1")
provides=("${pkgname%ttf-}")
conflicts=("${pkgname%ttf-}")
source=(
    "${pkgname}-bold-${pkgver}.ttf::${url}/releases/download/v${pkgver}/KNBobohei-Bold.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/KNBobohei/v${pkgver}/OFL.txt"
)
sha256sums=('4d641bd7885bed7e32eb823723c93259d9678923c4606803fa96d080af465825'
            '2f4d367072f5f4d154c0e1a6716f04d10a707a05ed5540a9bc68c7661d0e4770')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm444 "${srcdir}/${pkgname}-bold-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-bold.ttf"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}