_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.12.0"
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
    "mipsel"
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
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('4eed0346819b5633a2c5fc602619b09d177aa84de8f3f33dd186dbd6bef0d84b')
sha256sums_i686=('4a1b74370d7528ebcb9383de6e60056eba1173df13a7e6af4c8f19c5dfe95af0')
sha256sums_aarch64=('6e61ac2899ec3ad506e15d2e8a2f5d6e23e032d5d26d4d610c2168e22fe97ef6')
sha256sums_armv7h=('b7cd51c4dd96a7cf9762052745db7454e784a326fed4476269cb1761d4e9e6ca')
sha256sums_armv6h=('fcaef15b196aac606a37e345e85e575a66b5d5a9a9ef37ed28b75be1b2736804')
sha256sums_armv5tel=('7bfe928e73d5f3270d0b39826265dc1df7ba14ff48fb06f56a9d3c9c2eb8dca8')
sha256sums_mips=('45e111c7f8bf4427d38a56af72044b5e27f5ae31616b0f135b7bffd453e09ec4')
sha256sums_mipsel=('660971237a5d624d5ff6628cfca855a405d61f20b8e0e17ef1d302257a53aafe')
sha256sums_mips64=('d5f5ddfe47a1bbc804521e2dc4865c1bb9b7331292d8fef7ff1e710bfd37ade3')
sha256sums_mips64el=('4d1a411faa9b990271f5b9fe38d6e7d081a11764f5d3a5d303bd0ca52e992617')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
