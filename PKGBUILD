_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.1"
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
sha256sums_x86_64=('2ed8ee25defc363a59ee1a980cb43a60ae8c785a7534434ff4a688998d4e93f5')
sha256sums_i686=('c2a9dd56b3bd35987edf1b1c1fcab22fd8a8d5045015d5ed89fb29cc262cf019')
sha256sums_aarch64=('53f7499bb77b736829e9bb7c8443404183f9fedafb68f8f2899c2e14cf0c2d89')
sha256sums_armv7h=('edc3a0a18580cd8bdcf76225d03ec8a735473717e8323f0b20febf596e04c2eb')
sha256sums_armv6h=('e81b9bc6338615e831f3d701d25da94c5383586dfbf25f2a9e72f407ea6545d6')
sha256sums_armv5tel=('7e288f962add0a12cc2604a27f3d1430fdc42d51a0734fbde68935fd3ee49969')
sha256sums_mips=('c309f9ecbfa61faddf6c5223dea98bdbbc7367db9b1eaf4cb2678fe7c5e8ae6a')
sha256sums_mipsel=('e04e536482a39a3a34dfbae9ce29bb480def366f599d99c7ccce80a37b505d9c')
sha256sums_mips64=('6abaccf33042cad784f60cd2c645da58887f525853c5938286592990ae08d08b')
sha256sums_mips64el=('5631b8027a774ce927152eeb0a57a17fb3f6979b685295d7358c507ffe9267f2')
sha256sums_riscv64=('e12275dfbe945a1dc6fd2cbdc49c166a827324ee65e0e92c543a29d82d4c18eb')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
