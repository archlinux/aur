_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.9"
pkgrel="1"
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
sha256sums_x86_64=('f301a9cd929140db5796ebf8b0ed2f8abd70a7f697020177d90c2a4fe3220772')
sha256sums_i686=('01bcecf18ec919b515dc18f885a798d20c5b8009099ae9167201bba31a82d129')
sha256sums_aarch64=('2b725ecf482396da08c05a0d4e0e840fdedfe23d7e201862b6b8ac63774d7dee')
sha256sums_armv7h=('958b3d9c3f56bc39bb5f95f066fede2af6d71607a710452cc8e8e3ed6c087b83')
sha256sums_armv6h=('ece40b899d50f2f36e984a99f44fef890169d47cb71b8868c202429d260d9bdb')
sha256sums_armv5tel=('f9c86bffcbe8162bb0d2d2d22adf562fae7faea04aaacccefb9a2343acef93ae')
sha256sums_mips=('2814f1ed17433fbaf15b35dc7f5867942a002ab5363ec4d8a0e049c82bdcf430')
sha256sums_mipsel=('21fd8d5dbc68aa97e148258519f3fe0f65211d54645f5b9d8b72ba5d94679ab4')
sha256sums_mips64=('d6b58058105389398e4335941b412fee66db21b00eb5143c214e4c902fabe829')
sha256sums_mips64el=('ffe2d014780afc872d1c119194db1a81d5c37dcf70f3dd030a040a9801802b12')
sha256sums_riscv64=('fb8f4b9bd68e68480adb0f0243bb52f055f52c6aa30e4f9952a2da4c52ca1b37')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
