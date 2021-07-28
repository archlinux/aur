# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-e803-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck803-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581563230796922368'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-e803-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594864589138/SmartL_E803-v1.6.zip"
        "csky-cpu-ck803-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577156267207/SmartL_CK803-v1.6.zip"
        "CK803S紧耦合IP用户手册-${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1593394747592/CK803S%E7%B4%A7%E8%80%A6%E5%90%88IP%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf"
        )

sha256sums=('4efdc7f81b50a49068db7b43a55fdfba8051ea2bc43edce93bb5297af483dd9e'
            '6d4c071e41ac4df71500cea8a0dae0895c2040b8d3ae35a5d13316960f9647b0'
            'bce81ca51bd69c7c3fcc1648768effe0167ba7f7682d6cab65233cc6e234da64')

noextract=(csky-cpu-e803-csi-rtos-sdk-${pkgver}.zip csky-cpu-ck803-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-e803-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU E803 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-ck803-csi-rtos-sdk() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="C-Sky CPU CK803 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
