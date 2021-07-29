# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-i805-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-ck805f-csi-rtos-sdk csky-cpu-i805-csi-nn-vdsp2-guide)
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581557831434502144'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive')

source=(
        "csky-cpu-ck805f-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577156380500/SmartL_CK805F-v1.6.zip"
        "CSI-NN-VDSP2_v1.2.0.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1585134607967/CSI-NN-VDSP2_v1.2.0.pdf"
        "CSI-VDSP2-I_v2.8.0.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1585134574910/CSI-VDSP2-I_v2.8.0.pdf"
        )

sha256sums=('43575274e71367ec66ed1c659f8884d40f1d9aba0a0621d43a99ca4d53fb23d4'
            '226099d76a268117bc9f9faa653bc6161c28fc1fe746e19a7b881cce16e1aad7'
            'ce11d9e3dfa95e1ba7deae47114b000d4323e4f6429b50ac116ac590f3b5c5cd')

noextract=(csky-cpu-ck805f-csi-rtos-sdk-${pkgver}.zip)

package_csky-cpu-i805-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU i805 CSI-RTOS SDK (ALL)"
    depends=(csky-cpu-ck805f-csi-rtos-sdk csky-cpu-i805-csi-nn-vdsp2-guide)
}

package_csky-cpu-ck805f-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU CK805F CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-i805-csi-nn-vdsp2-guide() {
    pkgdesc="C-Sky CPU I805 CSI NN & VDSP2 guide"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/cpu/${pkgname}"
}
# vim: ts=4 sw=4 et
