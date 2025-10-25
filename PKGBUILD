_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.13.0"
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
sha256sums_x86_64=('8c4acc06e298f46a5cc70624f34c9f3bdb7be59facff450826422b915b6c54d3')
sha256sums_i686=('8ece03a132bacf8650a56c6d7f4bf34242c802ceaa489a83d072629dac721990')
sha256sums_aarch64=('45d3c7753c7eb3baf686baf130baea559fcd65bbed484475a88b7a652d70ed46')
sha256sums_armv7h=('60eec3a7520e369f710c97e417f0a436027b4547cefe98d1424057f343e79163')
sha256sums_armv6h=('ee1897ddb6f6abdf2a21a5dbdf01ff14cea72e8b50779c96da212d08ae88956d')
sha256sums_armv5tel=('035cb3d1c6ebb181473cddc83cc4e7c277c0326534a0bae73d6092befc8ba99d')
sha256sums_mips=('23d900660e07685aef9505fe8ac81f9955c9015455748a5ae1cf4a1d04ce7482')
sha256sums_mipsel=('62d36c765398230b6798ac93c5f56a2c2db1d5394ef24a8bfbe5a22db99d7ee5')
sha256sums_mips64=('d982c161044b36a6f24c2ec28d7f5faa425bc93d922dc1eab478e5b22904bff9')
sha256sums_mips64el=('d5e5c6fa5851eaddafbecb9526e4cb138a0e50e1e5f266a68c6469be9cfb9c6f')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
