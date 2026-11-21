_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.18.0"
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
sha256sums_x86_64=('e675f829a0fb85774ff6040f14b982cb78a8bbd8c3cbe5099cbdaf2615af98a2')
sha256sums_i686=('06ced881c4edd0be8593a505c1987438fe5246cc7a9ef02be2bb78613d0827a7')
sha256sums_aarch64=('a5ffd3e136aea3b213ef432791fea85e91df6b27af0ff5ce3d0eae3e954d32d4')
sha256sums_armv7h=('5a34beac3dfaf9c5c1c3bf3624f5bc27f354864937f6b3d01169b9f5881176b4')
sha256sums_armv6h=('e1ec9d1298b6f525f8f0a3758066d940b2ea39735317fb734262395e7c798dd9')
sha256sums_armv5tel=('bd753c76753267f1a582e55875236ce7b0e74d9462004c85cf1697fbaaf5591d')
sha256sums_mips=('faf0f293490abdf95193fe0f976ffd360893126ddb36fd05f4a4b3cc532f06d3')
sha256sums_mipsel=('00c71edd482657a3f40c71529de7a3917dedf518063589cc4ddad7d4fec93411')
sha256sums_mips64=('eebc5f0fb5682d0445515b46f0be05b5df7702186ff116674e1a2b3acefc2151')
sha256sums_mips64el=('c000d3e5e9f27f16c00aa10ecd8e03784bd94fa8022ec74f242c9ac74ce12be9')
sha256sums_riscv64=('ed77f88cad4e1e45d715c175751912350f5cc841e1e6c6c32706521d11e22efb')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
