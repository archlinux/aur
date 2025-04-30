# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.5
pkgrel=1
pkgdesc="Binary version of mihomo."
arch=("i686" "x86_64" "armv7h" "aarch64" "loong64" "riscv64")
url="https://github.com/MetaCubeX/mihomo"
license=("GPL3")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("mihomo")
conflicts=("mihomo")
replaces=()
backup=("etc/mihomo/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("mihomo.service"
        "mihomo@.service"
        "config.yaml::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v${pkgver}/docs/config.yaml")
source_i686=("${pkgname}-i686-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-amd64-compatible-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-arm64-v${pkgver}.gz")
source_loong64=("${pkgname}-loong64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-loong64-abi2-v${pkgver}.gz")
source_riscv64=("${pkgname}-riscv64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-riscv64-v${pkgver}.gz")

sha256sums=('87bede7cb2ae10e087bdaa0672f98c4899a3c51cadddde2ff2ec74d5facfb105'
            '4549a95ecac88545366ffee2f9c32d08560d0423fa9afa5bdb2a46458ab544e9'
            '97d510afb526721f555a39a8c642b8018c409ca8bb10d6c9b1e13932b82e3dde')
sha256sums_i686=('97298b3e577db8557a150fba944839efd15a33845a270c5b3a7734885414f976')
sha256sums_x86_64=('079f2cd4935271c99b229dde29a02093b90f0b505d0410f84c74ad0829c97d78')
sha256sums_armv7h=('d6a1def2b6b18fc17915fbceba31a0b7fa62d43078fec513689b54410248b682')
sha256sums_aarch64=('a821053aab3fe973bdb9a2fd22abdd61d90f9034f7301964f4a440d3c0b1dbd2')
sha256sums_loong64=('92518a809c34595291ea724658dfbce65cd6d371911d2f03996ec96357c2eaee')
sha256sums_riscv64=('ebd0fea0a0bb22b3f0e54d93f551100a02b9ad0a80a4d36e33d90936fc3275ae')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
