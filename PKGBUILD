# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.18.6
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
        "config.yaml")
source_i686=("${pkgname}-i686-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-amd64-compatible-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-arm64-v${pkgver}.gz")
source_loong64=("${pkgname}-loong64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-loong64-abi2-v${pkgver}.gz")
source_riscv64=("${pkgname}-riscv64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-riscv64-v${pkgver}.gz")

sha256sums=('12df82e131fae39e0b417fbf692c395ecfebcb959014981a0d58003deba0938f'
            '0455abd5a27b98e72466d60eb37546299eaf021ad61f28fc57724d7a7516de85'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')
sha256sums_i686=('1b975ca6dc6ef12f9b405ab5dc8d8c88b9f30217724e6b42f88f71d2d4970392')
sha256sums_x86_64=('501c12c87fff82e4ac10943b0dbb39247f12b1a7cc1229370faab932af1387de')
sha256sums_armv7h=('dbe44644de0b58ff67253af676d04bc508607def3eba8c1bb6fa42775641fb35')
sha256sums_aarch64=('078fe3f5b68fd6f77f4f421ae49957495766ef67f713eb886bf6d6f51333f84d')
sha256sums_loong64=('4b0c4d6c64988687377b89fbfd9181322e6d3735dcf552755ddef65480ac0830')
sha256sums_riscv64=('2582f37ef87f28fe60b7caa16a5dedeb59e391c1f252a2a35902425e300b4f8a')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
