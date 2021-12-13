# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.2.1
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3948120165480468480'
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('tar')

source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1637736198212/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.2.1-20211110.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1637736097213/Xuantie-900-gcc-elf-newlib-x86_64-V2.2.1-20211110.tar.gz"
        "ReleaseNote-${pkgver}.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638611214392/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519318318/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519335581/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519352306/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519371339/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519394014/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519414216/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV Intrinsic Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1638519439535/Xuantie+900+Series+RVV+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.1.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1639120240022/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.1.pdf")

sha256sums=('9a346d12d58d96191334a1800868b9b2b0bf8fd986efe01eb11d9189c2e3c9d7'
            '6d507ce97086301b64970428cc8c3abd357853d1bd473c8db20a3859422ba16d'
            'edcc19f7015c589ff307c5e830bc419d35be2483400f05b1a2e6c3cf4d5351bf'
            'ac024c5c79cc203756eef5fe8ff61916f83e72cc0202672c16a6e46a79c2a595'
            '924c7cdc84b73a5ce05e7c86217bcf2fc9b5985e64cae93b8b620318c7dd318b'
            '8e718e2dfbfec6eef5d0bdc6c9d9e3d306055ef98c694e927c16d626d5ad5171'
            '8b14b534a53691d575654dc5d995c445b156d2ad3ab0e867b4b02b42d10baf97'
            'f057818dcba4bd534d78f31687e31a1eb66e8677b8f22710388692a1103abc0a'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '22ba1194fa88f56e85f10e88dfbbe64f8cd11f4621faa8fca2cb5706bd1ee79d'
            '2a85b77c8313233562c35a439779a04bf2af2e5886f815f454c4f0df531b5be6')

noextract=(csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz)

package_csky-toolchain-900-series-bin() {
    pkgdesc="C-Sky toolchain 900 series (Xuantie)"
    depends=(csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
}

package_csky-riscv64-linux-900-series-bin() {
    pkgdesc="C-Sky riscv64 linux for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-riscv64-elf-900-series-bin() {
    pkgdesc="C-Sky riscv64 elf for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}


package_csky-toolchain-900-series-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
