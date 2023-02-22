# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.2.5
pkgrel=0
arch=('x86_64')
_id=4032826170687950848
url=https://occ.t-head.cn/community/download?id=${_id}
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')
_url="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource"
_dwurl="${_url}/"
source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1649645611009/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.2.5-20220323.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1649645436838/Xuantie-900-gcc-elf-newlib-x86_64-V2.2.5-20220323.tar.gz"
        "ReleaseNote ${pkgver}.pdf::${_dwurl}/1649841293136/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1649417786945/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1649645753293/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1649645820004/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1649645880185/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1649645918587/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1649645940353/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1649645964591/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1649646000573/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.2 ${pkgver}.pdf::${_url}//1659515330848/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.2.pdf"
        "XuanTie Linux 开发平台使用说明 ${pkgver}.pdf::${_url}//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf")

sha256sums=('3c4627c58d411e5a6998eabf08472fbef0652d753d71fad4f93f7ee8390d4a74'
            'cb3916cf1f1bd3430a282a40c7dfb80fc471f71226a05917462bc1f65fa2cbdb'
            '729c8376ee9e52bc5145786117094b4d6671e50c62baf16de956134d7052f6c9'
            '880e15df76870ba4b69921f9ab382dec120a981950a53cf64bca5db0a559008b'
            'ad96168377fd14e98abb81c8350bca8ca88f217522bc4d6cf50bc8afe26287cf'
            '3f8ebde45f41d838af3f046951779f6a934ccd8479bad17357eed504cb4cae8f'
            '47e42393e7b6116f59a59e225f4da5bbd80ef3709ff3f4e12bdccf2a64996db0'
            '4c23cb10f6337dbd578990126ee36f172f1703a020dcbc3026767b5fcd951912'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '5e3157152d804de68733c592bf7c7f7c87589d97fa363c15a0095fa18836b95e'
            'f88c3ab8bb92e82bf1fb5ec873c15e16ec016eea292fa4a3f06ad7641fac7688'
            '459643494c06d46fb329d5fb39e68e6741fae713610faeeb8fae4026be751b2c'
            '77bf95d0126a4401b6685aa93225181ed49dc55e5c0b04bbbae624a582722452')

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

    cp -rva "${srcdir}"/*${pkgver}.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
