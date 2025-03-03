# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.3
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
sha256sums_i686=('ea932603198492f588b72ff4753c63fa8e2e1b410c075fda555d5fa3145aff85')
sha256sums_x86_64=('76d226a2077b82082c8790ffa44a623734de8ad0c1d55311c37f868c7cda467d')
sha256sums_armv7h=('0e3d7c43d7d6824911123a7f17fabc4fe5e63e12f741a3a576d3eb70240c7a3c')
sha256sums_aarch64=('ebd6e2253bc1a90bbbec6aa4852702c4e703b66550806a45d6dfc1a8d1629f1a')
sha256sums_loong64=('1a8e62d4814b8c2032c7eeae9ffd4ec751cb24a830e45632467666d33541dcab')
sha256sums_riscv64=('07d3268c6583865c96328f0683d4eca1ee8cfe0e18dcefe59e20892de7e0ff48')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
