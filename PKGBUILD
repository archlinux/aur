# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-harmonyos-sans
_pkgname='HarmonyOS Sans'
pkgver=2026.06.12
pkgrel=1
pkgdesc="HarmonyOS Sans Fonts.华为鸿蒙字体"
arch=("any")
url="https://developer.huawei.com/consumer/cn/design/resource/"
license=("LicenseRef-custom")
conflicts=("${pkgname//ttf-/}")
source=(
    "${pkgname}-${pkgver}.zip::https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyManage/011/111/111/0000000000011111111.20260611171743.77886644144213121813005934094365:50001231000000:2800:0CCF575ADA0FCAD85EE25909C15C402A40FA94ABCCFEFC5BD37061A6B94239FF.zip"
)
sha256sums=('2d129ad1b7f8193b9b7be54d126d79b6d02170dd166422bea18d84b2ce55a2aa')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    find "${srcdir}/${_pkgname}" -type f -name "*.ttf" -exec install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname//ttf-/}" {} +
    #install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
