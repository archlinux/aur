# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.17
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
replaces=("clash-meta-bin")
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
sha256sums_i686=('3fc5c7ecd2c3676c915ea44e28c16b5bac6d9190d8ee27a6fa239842d007546c')
sha256sums_x86_64=('960d48079d4e4a23e7aa35fbd1b7e523cff35000f15f40caf5d97a0bd5333cfb')
sha256sums_armv7h=('f1dd9b26a247d065039ba8aea84f19accef3b7e9e174b3037230499e0dc8adb3')
sha256sums_aarch64=('915cacd0cd51206ab467a5bd426a758d02272bb3adb7ab1d8ea372e541570778')
sha256sums_loong64=('c7a4c638d588a3acff1a1f520d1724889fc9a20e49c86f347ab3e377466ccb23')
sha256sums_riscv64=('14f6239f59492a00c83e0ee37c54f6027d48c70a4abd16701f754b7e6932e103')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
