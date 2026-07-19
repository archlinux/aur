_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.2"
pkgrel=2
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "armv5tel"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "riscv64"
)

url="https://github.com/jeessy2/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service" ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv5tel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat.tar.gz")
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_riscv64.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('e847a748aabe10e1a8c21d3fc2d65cb7c6a4c5f1d4a850a178008a2eb2974319')
sha256sums_i686=('60869d25b72474132f1ace74f04bf7270c34e1e80107d01d9e6c66b0be34600c')
sha256sums_aarch64=('157a2ac273ddc0008cb94822e7d7b1b3932c80125b6fba3fd942f817907d14ac')
sha256sums_armv7h=('e972a3d852c9cccee2c0f92fe7e11bf42a682ab0592dd0c26fb78ad4c5ddc318')
sha256sums_armv6h=('c1f00cb3705e0325f24dee8f2e35ceddaa2cd2ca99c82e66364db3f4548fc06f')
sha256sums_armv5tel=('4c410e4aaa774cced6ffb632544156bb731f6d60fdbe5f26aed236fd609fe14a')
sha256sums_mips=('98e2882c1199fd47b0d524b0b0a74ce87e8a4f43b554a6d1668a897434eb052f')
sha256sums_mipsel=('059e1a7e06426a2507fce5c0abfc83b08a52e0df6a2c5cdb53983f33576bcc24')
sha256sums_mips64=('06f34e92e3ceeb0fa19ab7f98b2602dd7fe5dd841748c09357ef66ec6d04553c')
sha256sums_mips64el=('2e2c45ebaf3c9f8cd590ef338d8f404154e69c55e9c1febdf162f70f900c9732')
sha256sums_riscv64=('249f7f1de1488fd744858aa2db59459a19dea692148627e36c588a6f9673fba2')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
