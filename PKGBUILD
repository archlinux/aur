# Maintainer: taotieren <admin@taotieren.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-series-toolchain-bin
pkgname=(
    $pkgbase 
    riscv64-xuantie-900-linux-glibc-gcc-bin
    riscv64-xuantie-900-elf-newlib-gcc-bin
    riscv64-xuantie-900-linux-musl32-gcc-bin
    riscv64-xuantie-900-linux-musl64-gcc-bin
    xuantie-900-series-manual
)
pkgver=3.0.1
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4382928864901402624
license=('unknown')
_dwurl="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/"
_linux_ver=6.6.0
source=(
    "ReleaseNote ${pkgver}.pdf::${_dwurl}/1732866280418/ReleaseNote.pdf"
    "riscv64-xuantie-900-linux-glibc-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1732863205852/Xuantie-900-gcc-linux-${_linux_ver}-glibc-${arch}-V${pkgver}-20241120.tar.gz"
    "riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1732862099878/Xuantie-900-gcc-elf-newlib-${arch}-V${pkgver}-20241120.tar.gz"
    "riscv64-xuantie-900-linux-musl32-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1732865322360/Xuantie-900-gcc-linux-${_linux_ver}-musl32-${arch}-V${pkgver}-20241120.tar.gz"
    "riscv64-xuantie-900-linux-musl64-gcc-bin-${pkgver}.tar.gz::${_dwurl}/1732865487382/Xuantie-900-gcc-linux-${_linux_ver}-musl64-${arch}-V${pkgver}-20241120.tar.gz"
    "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1732875912600/Xuantie+900+Series+Assembler+Manual.pdf"
    "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1732875930689/Xuantie+900+Series+Binutils+Manual.pdf"
    "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1732875943973/Xuantie+900+Series+Compiler+Manual.pdf"
    "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1732875958827/Xuantie+900+Series+GDB+Manual.pdf"
    "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1732875977349/Xuantie+900+Series+Linker+Manual.pdf"
    "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1732876059036/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVM-0.3 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1732876079504/Xuantie+900+Series+RVM-0.3+Intrinsic+Manual.pdf"
    "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1732876096773/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
)

sha256sums=('f456f50227ace8e8c3e68bad8aaf9f2679f969e484c3787a9d3611e8b9272401'
            '3a16fa000d5716a9a7229db567b04b86093274a13e2dadc94d8d0e0031f18453'
            '7f41b3c1b70b179d54e28e129531746f5e329989868d4c8325b0931c7cb77410'
            'b981ae62f06556959ba61a8a691a21b8763b49098e360a0d5376504934ab3171'
            '02945500c0752ec41d35a0582e26d308c94b90dde8cabe90cc38a4a4d7b4f31d'
            '36bae6624b4a6dd5625c37c1e3a0a5e633e4c9fd9f424540d2b17cfd5aa46f41'
            'a4550d5c0a70c778919639295dadc8b11bf8d6d204daf50e0067fee526435a86'
            '98095235216c9021781c3002c6fd54c5c03d9d65ba89af38350b75ea5dc36e83'
            '1de0147c9752da512ae2f00349330489504946aa640026a8dca620b0c10a4593'
            '892fd5194b19e95aef5ccd8adeafd10c770b8e05a7677141eeeca79de9cb78bf'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            'ae1f4025e0796b3b9f5a1ec709ce9056f9c23d0d63a94536b7b01d7198562ac9'
            '521450390bb4df0d86b8cbc0b1db136974f168db724ebaf3ecb2b635ae678aac')

noextract=(
    riscv64-xuantie-900-linux-${_linux_ver}-glibc-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-elf-newlib-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-linux-${_linux_ver}-musl32-gcc-bin-${pkgver}.tar.gz
    riscv64-xuantie-900-linux-${_linux_ver}-musl64-gcc-bin-${pkgver}.tar.gz
)

package_xuantie-900-series-toolchain-bin() {
    pkgdesc="Xuantie 900 Series Toolchain"
    depends=(
        riscv64-xuantie-900-linux-glibc-gcc-bin 
        riscv64-xuantie-900-elf-newlib-gcc-bin 
        riscv64-xuantie-900-linux-musl32-gcc-bin 
        riscv64-xuantie-900-linux-musl64-gcc-bin 
        xuantie-900-series-manual
    )
}

package_riscv64-xuantie-900-linux-glibc-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 glibc toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-elf-newlib-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 elf newlib toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-musl32-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl32 toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900/${pkgname%-bin}/bin'

export PATH
EOF
}

package_riscv64-xuantie-900-linux-musl64-gcc-bin() {
    pkgdesc="Xuantie 900 riscv64 musl64 toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900/${pkgname%-bin}/bin'

export PATH
EOF
}


package_xuantie-900-series-manual() {
    pkgdesc="Xuantie 900 Series Manual"
    install -dm0755 "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"

    cp -rva "${srcdir}"/*${pkgver}.pdf "${pkgdir}/opt/xuantie-900/${pkgname%-bin}"
}
