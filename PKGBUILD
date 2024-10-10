# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-honor-sans
_pkgname=HONOR_Sans
pkgver=1.2
pkgdesc="Free honor sans ttf fonts.全新荣耀字体向全社会免费开放下载使用"
pkgrel=2
arch=("any")
url="https://developer.hihonor.com/cn/doc/guides/100681"
license=("LicenseRef-custom")
source=(
    "${pkgname}-${pkgver}.zip::https://contentplatform-drcn.hihonorcdn.com/developerPlatform/${_pkgname}_${pkgver}/${_pkgname}_${pkgver}.zip"
)
sha256sums=('8c7eb6f940479343eea7c18745f2d66679fb853100a32591ea68bf62fd734fb6')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    find "${srcdir}/${_pkgname}_${pkgver}" -name "*.ttf" -exec install -Dm644 -t "${pkgdir}/usr/share/fonts/honorsans" {} +
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${_pkgname//_/}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}