# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.2.2
pkgrel=0
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3987618263851929600'
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')

source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610912420/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.2.2-20211202.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610821624/Xuantie-900-gcc-elf-newlib-x86_64-V2.2.2-20211202.tar.gz"
        "ReleaseNote ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638611078695/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610535121/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610552757/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610573964/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610594898/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual ${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610616193/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519414216/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610654335/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-1.0 Intrinsic Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638610670068/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.2.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1659515330848/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.2.pdf")

sha256sums=('1534c650f0042f149987786e3a49624d4e606e31ff94cce912abe3ae9c9410da'
            '02ffdb9b1f1f961e30cf63ccd146f787e1caa6da6ac5156752257b9ac25e09ac'
            '89ce4cbb070adaec1ce8f190285be1b9cbc05afcfb2eee57c954af12ca9ee12b'
            'd8a00f67446bc2004baab76302a6e42710c3bb54b9fb9c1381b78d77067f32ab'
            'b7aaa08f68820a8dca079177f7d73872ab1261fca58a101d7cb3ce8b822e0f17'
            'df3ba982b0cc22cbf0148a3cec0459dd505bba6328d8cdecf59dacf4e69501ef'
            'd7a492e99370d7de18d037b2249c37ff3a35b3ee8b2971a8d2a4a4391a2b7c08'
            'fee453c2c26c27d60ad587b0de11a29eda3441ade3f54e69f31d0f6633bd886b'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            'dab402404508723cb48c9e9b5966d87a085f08ddfe0019d4a9fac6738425826a'
            'cfdfdf2242ea6ad0a49ab46919d9b65fbf07066911cf3709a04a85691b251f0e'
            '459643494c06d46fb329d5fb39e68e6741fae713610faeeb8fae4026be751b2c')

noextract=(csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz)

package_csky-toolchain-900-series-bin() {
    pkgdesc="C-Sky toolchain 900 series (Xuantie)"
    depends=(csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
}

package_csky-riscv64-linux-900-series-bin() {
    pkgdesc="C-Sky riscv64 linux for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-riscv64-elf-900-series-bin() {
    pkgdesc="C-Sky riscv64 elf for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}


package_csky-toolchain-900-series-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -rva "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
