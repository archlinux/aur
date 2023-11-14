# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=clasht
pkgname=${_pkgname}-bin
pkgver=1.20.0
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions. Convenient for you to witness the larger network world"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64" "riscv64" "mips" "loong64")
url='https://github.com/DryPeng/clashT'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
provides=('clash')
conflicts=('clasht' 'clash' 'clasht-git')
options=(!strip)
source=(
    "clash.service"
)
source_i686=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-amd64-v${pkgver}.gz")
source_arm=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-armv5-v${pkgver}.gz")
source_armv6h=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-armv6-v${pkgver}.gz")
source_armv7h=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-arm64-v${pkgver}.gz")
source_riscv64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-riscv64-v${pkgver}.gz")
source_mips=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-mips64-v${pkgver}.gz")
source_loong64=("${pkgname}-$CARCH-${pkgver}.gz::${url}/releases/download/v${pkgver}/clashT-linux-loong64-v${pkgver}.gz")
sha256sums=(
    "2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a"
)
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_arm=('SKIP')
sha256sums_armv6h=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_riscv64=('SKIP')
sha256sums_mips=('SKIP')
sha256sums_loong64=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}