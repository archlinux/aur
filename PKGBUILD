# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-harmonyos-sans
_pkgname="HarmonyOS Sans"
pkgver=2022.7.4
pkgrel=4
pkgdesc="HarmonyOS Sans 字体"
arch=("any")
url='https://developer.harmonyos.com/cn/design/resource'
license=("LicenseRef-custom")
conflicts=("${pkgname//ttf-/}")
source=(
    "${pkgname}-${pkgver}.zip::https://developer.harmonyos.com/resource/image/design/res/download/general/${_pkgname// /-}.zip"
)
sha256sums=('fb02c86e358cd9aad8d4dfa957ee502381e7ee2e94499a9133add4324b6ce69a')
package() {
    export LC_CTYPE="zh_CN.UTF-8"   
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname// /_}"*/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname//ttf-/}"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname// /_}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}