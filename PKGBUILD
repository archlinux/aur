_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.10"
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
sha256sums_x86_64=('a9e4f5b5bf9f899bc75e0395412c55a39680e326219988385b90b77bb2fbedf2')
sha256sums_i686=('ee4d207f464f757d0b781d2b6e607bcc816bca71d495068d33e651a9dd42777f')
sha256sums_aarch64=('049fe783343813134903014b0aad7427b1b7805899e545e4b537d65433220445')
sha256sums_armv7h=('86d5c9ee01f256e776ddfc8a52258af9139d544bf8a5333ec8a699d6f752b855')
sha256sums_armv6h=('65f527e6e36116f94f1f99bc2889d4b7dd53fde8275a9b8c4bb0c28570e03d9c')
sha256sums_armv5tel=('372e79f53dc91473cc0af11a795a3e9db44cd4bf58a36e7c86b25e8fc8de6515')
sha256sums_mips=('5ec76bfef347ba6984589922238225eb3fffa4db544081c2a3548850651dc7a3')
sha256sums_mipsel=('50627eb4558b72bb0e735991c2fd30ea7b507b287c2fd8ac60f191a8f364739b')
sha256sums_mips64=('094c27e83bb76a7f08e1d398ac809161008c9f0a33159e3dfad0a1b333bdffd3')
sha256sums_mips64el=('c09f43e528aa39ae5e6c06dbcadae858b167e1f0728b9348795fd8cc7c9761b4')
sha256sums_riscv64=('dc5135a3b0f87f1d63bfc97a77f8089fe7638361d4b81417f85b4cda48ac57ac')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
