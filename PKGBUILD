_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.8"
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
sha256sums_x86_64=('6b13e86c35b1c8c0d308bcbfc5198ad3b68e96b678e3a2dc3bae67201b0b91ca')
sha256sums_i686=('75aa7429143484704a9fbf606f7d2afffb42de0418193fd229897f25ce59b2ea')
sha256sums_aarch64=('7754391a50d21b3f180883f70990d5a6a593be1a07cf8a62fe1aacd5106fd517')
sha256sums_armv7h=('60b85d9d8cbf7e4bd68182dec412f81af4d6c04fcca09bf766863047e177422c')
sha256sums_armv6h=('6f956f96a363cbdba4e4abd6064ba57fe3164d492c8d96040ad4514265156bfd')
sha256sums_armv5tel=('4d1a2d1f7b9511689c46ed11fa8228045d2dd7820aeccfeb6e5c5aaa2e7730b2')
sha256sums_mips=('d8d9eabb6283b176757d313f0c38a89f70f0c55673538276c9c9da1997054408')
sha256sums_mipsel=('0b9e55f119daa6c8162bbe5b6c8ab360ce8ed7d7f72cc39f1f98bb0b6afd2a3f')
sha256sums_mips64=('47b4e81f144c0573c587a7f960b307e8a1d26afdc9b70a146861d91fe9d68f23')
sha256sums_mips64el=('f9899f869f33089b1afad9b4dfe14f2c76f073692bb5734d893c5063ffb70a6e')
sha256sums_riscv64=('ecd8a1d490cb5abb0752b8722787407aaef3d2f8414e59de6fb9e7aadf6a9dd3')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
