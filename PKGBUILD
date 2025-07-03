_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.11.1"
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
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('534528c5d8971d9bd4eb17715761fe082555a359d05a408afe4917f20c44fd4e')
sha256sums_i686=('ac0515bf121ed6965daea502e63bafdc479f57054dd94020ecdee82550209ff4')
sha256sums_aarch64=('eb6fde872edf00cb31aed4fa43fbeff1bca2b6b5735b85364fb037def2c62764')
sha256sums_armv7h=('5232c1d5298f422bced9c1b256f6a5e18988700ea40e02f3c7f5617f567815a8')
sha256sums_armv6h=('ed43a8b886e6d564709e404cb9b59cf89383842850cc2679590980da353a7725')
sha256sums_armv5tel=('80fe9b03075ff7a9dbf338d36b5b6217c0ae52d32edc11acd390d4b02cd16efb')
sha256sums_mips=('1415f03e3f8a6c7893f6b5bb98dfd1cfb0da7c1a61a4353807d72668cc2f3a2b')
sha256sums_mipsel=('0dfca3d0a924082cc56cbc9fdf2494849666f8cba2462af47683076f11e85802')
sha256sums_mips64=('cd557a6c7e121cc7eadda2f143ab2dd7054d812ecb4848d28a2dcb502e92c50a')
sha256sums_mips64el=('70d69e645832bf927e1995faee3d937985bc38b7bdab51161d92aabcfdefbb5f')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
