_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.4"
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
sha256sums_x86_64=('28690b79c23a4c4c04298f7abdf409b69b7b4e28d8caa3df22890ee790b0ccad')
sha256sums_i686=('c0afd6b7f417058450db6f2c597ce4a9c710388d44614f758ad1d6137575638f')
sha256sums_aarch64=('a2d3b4092d508c98db85fad45f229039d99666721a49352a39344d036936a778')
sha256sums_armv7h=('d45aac36838db5705e341b0d67ad738c76173057da0f36f87868b6a03fd3c28c')
sha256sums_armv6h=('02f43b136ec8a6af26bd6d5ed4f62ebdfd890ffa27c7a60b3f574cb29f8f3778')
sha256sums_armv5tel=('ec90343312ff615d9e6e7c9b356c61beb37324d3cfd44545c040a2e1ebf5c789')
sha256sums_mips=('9085a45c731e4e8326a8eb45d6d4191c41b1f7e19316b8661a0652544a8033b6')
sha256sums_mipsel=('0e1982e1b2bd4afe32f528595027b8513357af589bb2edeba92a244f2816cee4')
sha256sums_mips64=('a1ab1631812b141fc5f8502db6914c661963011532eb5a9f3ed00f417d3de565')
sha256sums_mips64el=('6cba6c546b323830313bef2efa9bec212bee4d8048833d41ce9da9104b5b7bab')
sha256sums_riscv64=('665b71151930a1457d9ae33b1cd277e8365c8824299fef4dc6d20f7ec1d41f26')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
