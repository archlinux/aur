# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.12
pkgrel=1
pkgdesc="Binary version of mihomo."
arch=("i686" "x86_64" "armv7h" "aarch64" "loong64" "riscv64")
url="https://github.com/MetaCubeX/mihomo"
license=("GPL-3.0-or-later")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("mihomo" "clash-meta")
conflicts=("mihomo")
replaces=()
backup=("etc/mihomo/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("mihomo.service::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v${pkgver}/.github/release/mihomo.service"
        "mihomo@.service::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v${pkgver}/.github/release/mihomo@.service"
        "config.yaml::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v${pkgver}/.github/release/config.yaml")
source_i686=("${pkgname}-i686-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-amd64-compatible-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-arm64-v${pkgver}.gz")
source_loong64=("${pkgname}-loong64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-loong64-abi2-v${pkgver}.gz")
source_riscv64=("${pkgname}-riscv64-${pkgver}.gz::${url}/releases/download/v${pkgver}/mihomo-linux-riscv64-v${pkgver}.gz")

sha256sums=('b4b011a4b5670b09cc7d21a73cbaf47e038ff3f504deb16afab460555572f3a4'
            'b4b011a4b5670b09cc7d21a73cbaf47e038ff3f504deb16afab460555572f3a4'
            '65696f4b2ac4ec31987b3783b712a2452418cbe464c23b648fca2a515e478377')
sha256sums_i686=('7fc38bbe57d6e58e6b6423bad5771ad4e525dbf0e1acb38418afa7b9ee614193')
sha256sums_x86_64=('e68933f58ce8fee6a3f2c4a445227527b947026687f6ba76983cbba1eeabfb8b')
sha256sums_armv7h=('28934926a991113c98fe4fb4202cbb3f4e76fa77b73e67a6c2ddd9d413205835')
sha256sums_aarch64=('fcb9e294f492eb9df9bca4e1f9c66a383f5e8eef1da7cd20ae5ac3d093fdaaf1')
sha256sums_loong64=('4711037e09ced0f7ace5effd8c939a9356323b3f2d9f0aa2278d6c3fef7a88eb')
sha256sums_riscv64=('e8a0c4313823bdc7c2aec8d395c0e59558b5ba449f38c19571d834ceb20d02ef')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
