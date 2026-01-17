_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.15.0"
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
sha256sums_x86_64=('fa540a9e4f51e5bc83aa48bae7504a868c7d30fb7c0c0bd647bb77f3ad05ea8c')
sha256sums_i686=('b9e1d03150ada920483382872e954035147034a1c3507808d4bf0816d2824b4c')
sha256sums_aarch64=('1ff41db81ab842737f3d7027e6820b22d711f9b1366054d340b282d84aac2d69')
sha256sums_armv7h=('87ea105c1bc669bff4742b20002ddb214d1b010fde9ec52a8f6483bc18ea7ff9')
sha256sums_armv6h=('ef34c897caffd4beac3a04c7bd3edb0e0b236819ead7b4dbf665cc2e0ed0c760')
sha256sums_armv5tel=('9266ae571514be4274b14916ecb51390bdcc3c5180b8ce142b9c11dcd284cdd0')
sha256sums_mips=('be0627e3209a5d7e23a8a7e952398a285ec78e5656f5667fd69a54e46ae8a916')
sha256sums_mipsel=('720bd7d5741b6de89654b2ca8dadb0d59f862bfa5e5b6906e1a72ce05720da72')
sha256sums_mips64=('fa05e83c6d072857542856d69e346b76240bbaf57525bc229f5ea07bda8405cf')
sha256sums_mips64el=('94acf421af302da7e4303b0117691b8fc9c39dd547d1ea3f51dcc44720777ad0')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}
