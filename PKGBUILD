# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.18.4
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
sha256sums_i686=('a94e7959209aa86217442e8f5624eb813c6b6dfa3c657f41757fbdfe1ebbd809')
sha256sums_x86_64=('3a1887c24eaf5d6817d9364bd85e1cde36ccfb2863cbe5d52326f5ccdaff2f7b')
sha256sums_armv7h=('cf3e3a9bd964d25b4e13df3df2302e6c96f895d435de99d36c13f3f738b0d47b')
sha256sums_aarch64=('4bbdc191afdcefa1903171e8b3e1b378e5b66bf4776d18b3556344ef9a85254f')
sha256sums_loong64=('d6a2053b45f7575ec2801c2b2c6269e5d4f6615c65bc8e184c349d4ecbfae4be')
sha256sums_riscv64=('20db35c49f4fe364bb59d7e65c2106014ffb828593bbd004159dfeafb861c5c6')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
