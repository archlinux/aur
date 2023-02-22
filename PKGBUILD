# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.6.0
pkgrel=0
arch=('x86_64')
_id=4073475960903634944
url=https://occ.t-head.cn/community/download?id=${_id}
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')
_url="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource"
_dwurl="${_url}/"
source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1659325511536/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.0-20220715.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1659318201401/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.0-20220715.tar.gz"
        "ReleaseNote ${pkgver}.pdf::${_dwurl}/1659317870882/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1659317892387/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1659317907807/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1659317928978/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1659317946456/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1659317964191/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1659317981912/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1659318003104/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1659318016898/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.2 ${pkgver}.pdf::${_url}//1659515330848/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.2.pdf"
        "XuanTie Linux 开发平台使用说明 ${pkgver}.pdf::${_url}//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf")

sha256sums=('d0ea2415d7bacccf0c5f042d25c81d388fd98c414657dfc8ca48a92430871762'
            '0704df809c40ea067b470fe4b09460806e3afedab8cb8a99bdaf9d32718661dd'
            'e178330e43ccedfd70fa5d9d34f7e4fc4acbc7fb1d96f62591c407f49ddd525c'
            '2170f34aee30b98e19e759b7145c9970ab90d7bd20e7de167be0a7f85dc85b8f'
            '1c3e12db1dcccf9311673a72e6fc4db6c27aa0065eac9637679da15a23c7f5a8'
            '41c3e2c862bfdcb9b6f3a738e92499751a6e0f63915780b61e4d4dc1baad25cb'
            '6160960b874fddae813f554f6cb56745a2955478708075d02acdea8db1529b38'
            '39f33c79d9977a030c2c015aae41cbe5e783fd87f4a7609e675324cf08fdccae'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            '50a58087d844bb5976dbc33729a3e5d4f7aebcbc09820c348a84e5a2e70396ba'
            '082cbcf77e870f5ca43893bbb0463267970842db60dfc96949ca4aee828c8e5c'
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
