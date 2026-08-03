_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.4"
pkgrel=1
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
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv5tel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat.tar.gz")
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_riscv64.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_i686=('d8f3e13e941a9e56d011a4eaa3b06ea9fdb7613c29c826d123a9fe3a85845a8f')
sha256sums_x86_64=('39bb80da1073a932fd087eca83543670e5a104d67f04e180a82a77c124e454e0')
sha256sums_aarch64=('f0263041d288b0b7c6c83d265a13dedff25ba04a1dd45ca80d571492871d2e3f')
sha256sums_armv5tel=('f396084f4b7bcda34105ec6d050cf629c9ecac44780e356055a5a7bafff0187d')
sha256sums_armv6h=('e7248cdd0be8dfab7424346c1cfb7d8fc609cbfa6f8b99674450f597a8a23d03')
sha256sums_armv7h=('a4a52cbff46a32ad1b008f91fa1e45dc03d9da72fc5698ad9d59cbeb8c77605f')
sha256sums_mips64=('9b55bc7606658be6a85870133b5b213c17e85d5faf9a0545297dd8ef14fb7de9')
sha256sums_mips64el=('806dea3a459282dc6b3a779c24bda74f9a28201cf51aa9fd2ae2420d09b5a333')
sha256sums_mips=('dcc27d904bee9dff5802f27a6830eb5db7113327e454f3f4a2e7bf6365c55be7')
sha256sums_mipsel=('a23b57e6cd6bf4f9c6cc2bbd76d1083fcecad6995e661c79f26b7dee42cebd89')
sha256sums_riscv64=('1d30b0085cad155892823d757462035ba965d3d22ad610fe548c5fe4fe0d2334')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
