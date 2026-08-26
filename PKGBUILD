_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.6"
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
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('d1d20a29ad7da4ba5ae6b8ba471ffe300e6df6859554b6766c02c614e4aeb448')
sha256sums_i686=('26a284fdb166ecc6e373429b3ccfb708b8a7d2701955c15e133c8f3fd66474cb')
sha256sums_aarch64=('9ea0a93da7a1ddaf41bd604cadb1c51b898bfcf9ff1edb2ff3518963ce57582b')
sha256sums_armv7h=('53e6fc7c081d1202edcb703c6e37e6650508635924598d4eafc93f1527727fa6')
sha256sums_armv6h=('5011cd67a229c2050d17c7b58dcfdc02e648da2dd744a2b9c0c666ba9e41be63')
sha256sums_armv5tel=('d94330660fa9819c5874b77d0f0cdae4082870a887907a40cc5f27245e38710b')
sha256sums_mips=('439a00fb32af713b507e57d77a3a4d2de69bd29782556c9e931394955d3eb45c')
sha256sums_mipsel=('8a575e03a79a79a1113c0804b01191af72ad1f8fb9b167538faba2140289ea07')
sha256sums_mips64=('0c7b22709772e608348ea9bbb6ed019f4a3dc467a8b63cdacffa1ab63b71608c')
sha256sums_mips64el=('613a244cfd639e3379b8e791b7099a065e1d07772d998653ff923bb0acbf51ba')
sha256sums_riscv64=('e24a72c546f34977fabc98b53507cdfed4d164bd88cad798c5c0e8ff1ef665cf')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
