# Maintainer: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-meta-bin
pkgver=1.16.0
pkgrel=2
pkgdesc="Another Clash Kernel by MetaCubeX"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/MetaCubeX/Clash.Meta"
license=("GPL3")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("clash-meta")
conflicts=("clash-meta")
replaces=()
backup=("etc/clash-meta/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("clash-meta.service"
        "clash-meta@.service"
        "config.yaml")
source_i686=("${pkgname}-i686-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-amd64-compatible-v${pkgver}.gz")
source_arm=("${pkgname}-arm-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv5-v${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv6-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-arm64-v${pkgver}.gz")

sha256sums=('9e8a28e22c159d7d70c258b65f47bc734543e54cb0cd3957ce19349aca145af8'
            '29c73ac66d6fe60bea4359ac1857e3452f26c2af792efd8dd16d558462472efb'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')
sha256sums_i686=('edc34b297e17f6a274b734f1a47f817e5ceb3cb9e966a17466c30a62e9ba0578')
sha256sums_x86_64=('ed3bd776e2f9edb0de03430f503dfde2d0fb966b7a97904826633822733e9901')
sha256sums_arm=('dd4e7871fbc1cec2199e4e4619de2bea339d1b4e55e8d2f46e84612b8bd2b370')
sha256sums_armv6h=('d7e19035a662eb5dca39381c63174eb1578b9cdc056dc6fe42b432465a80f9af')
sha256sums_armv7h=('09c971bff85435fe18ec458a19945ad0560ffbe7fa4ff9affacc712adc2b3cef')
sha256sums_aarch64=('2976293bdcc44b428a5d902a6b493f76c197cf7f84046a7f5ee456e7103c2adf')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-meta"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-meta/config.yaml"
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
    install -Dm644 "clash-meta@.service" "${pkgdir}/usr/lib/systemd/system/clash-meta@.service"
}
