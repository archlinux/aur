# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.25
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
sha256sums_i686=('534f4391019c3e3e47c7fb810c02bd6b3141d69e1facbb8fb29425c79832eca9')
sha256sums_x86_64=('8d14bf2edbf2911db004abaed12754d63041eaf87e565af6f1e589883cd93ec8')
sha256sums_armv7h=('ec02e06cb0a39437f7edfb8b5a9a4a8ee15057d96be512c65522708641183143')
sha256sums_aarch64=('0d2f19c4bf30121feff4ca51a1a5ddd7837ee1f9faaf930ca83533bca51e8b34')
sha256sums_loong64=('33e710a6f5ec789e9d9001cb50de21ef11d6aa24d0378fa9816fd4ef3022969f')
sha256sums_riscv64=('d58197e830bd68885ca8ea308417b9e54e70f3133647887eaca1057a7a77c994')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
