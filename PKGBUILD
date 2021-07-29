# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-c610-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck610m-csi-rtos-sdk csky-cpu-ck610mf-csi-rtos-sdk)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3801325677437849600'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-ck610m-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594195027667/SmartH_CK610M-v1.6.zip"
        "csky-cpu-ck610mf-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594194917534/SmartH_CK610MF-v1.6.zip"
        )

sha256sums=('cb7d2a7c0d1ab4348fd86270097a4c9dc32f99f40e97bd6cd1855597259f91e5'
            'eaefcda648f1b1c6f8688fbd8431b8d17cec539b2d4a57cfec2918165be62dad')

noextract=(csky-cpu-ck610m-csi-rtos-sdk-${pkgver}.zip csky-cpu-ck610mf-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-c610-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU C610 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-ck610m-csi-rtos-sdk csky-cpu-ck610mf-csi-rtos-sdk)
}

package_csky-cpu-ck610m-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK610M CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-ck610mf-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK610MF CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
