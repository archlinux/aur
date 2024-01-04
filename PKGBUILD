# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Binary version of mihomo."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
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
source_arm=("${pkgname}-arm-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv5-v${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv6-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-arm64-v${pkgver}.gz")

sha256sums=('db3ef7a0e8ae960700ab7828a59b0ee6dd39adf36fb21728476d6040e16617d4'
            'c0ebad4d616980b88bab06d6b0f6c686dbe601d389112d2ea10e52e0b00def73'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')
sha256sums_i686=('359b0fe7f2ecae7212cbd9605583507ec75118e6a869cc1556768062cb9d5107')
sha256sums_x86_64=('0283df740f2a8fb32668b4462dc908e1afc2098d8c9df475d13c8d7e4473de08')
sha256sums_arm=('6ce44966421c7590fe3d4b2647ecd56c6ee579a499a36bdc4d1e8eb6fb320952')
sha256sums_armv6h=('000c6f46d6f3c76d86dbd6f6cb78a7643172e141b2ef8489ddc48985ba19603e')
sha256sums_armv7h=('f8a0065bfe35be1f7544d21d8edbf2088417f1e51f57594db5a7d42c438f9e10')
sha256sums_aarch64=('980e2d74ae3724e6ce88f38ca3885bb756aee41359ee38f89799fa6fe6962e5e')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
