# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.2.4
pkgrel=0
arch=('x86_64')
_id=3996672928124047360
url=https://occ.t-head.cn/community/download?id=${_id}
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')
_url="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource"
_dwurl="${_url}/1836682"
source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1640771208032/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.2.4-20211227.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1640769638265/Xuantie-900-gcc-elf-newlib-x86_64-V2.2.4-20211227.tar.gz"
        "ReleaseNote ${pkgver}.pdf::${_dwurl}/1640770253990/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1640769217192/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1638774078901/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1640769332907/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1640769354028/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1638774154929/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1640769386768/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1640769416953/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1640769441615/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.2 ${pkgver}.pdf::${_url}//1659515330848/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.2.pdf"
        "XuanTie Linux 开发平台使用说明 ${pkgver}.pdf::${_url}//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf")

sha256sums=('3dd3e4ad722a56f05e07fe35811ad4111f5286d7c8ab0f35b5c91e4e8892617f'
            '22f2844439a4e972f4db9bc9eb89846d79139fa9df6ef3156799123fd6f53c6f'
            '592b471d9b057ae3ac000d6bd3d31efa5973f6aa2bf94529386dbef82147a188'
            'd6156548213bd0dc2fe20b9b13c2c1f545da14583fff591dbaefdc22119c8836'
            '0ddfda9876921b9ab598821f3d1a9f4b7a6cf6290f7f7c94cd362769e7fe775b'
            '8b5c7e7d45c33b8d14d80bec82dca1a39e2d3c3f2fa3d52f7386ea538ff99dfa'
            'ba76d2c4c25cab04e14256a74f9a93e51fc2bd1fc1a7928a893197d7310d2971'
            'a5264c6e50cc9ad18cfc5de3dfb41187ad2c494b5cf275cc40d3c883a0a8ba83'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '86f16cd5692c5afd14dd14a9ff68bdc83728e94ec86f2e5618fda24ce73d9daa'
            'a5a07a5e79e2a485874348d1a91fc22196bc273e3aee6453c735e8b8628faa95'
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
