# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.26
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
sha256sums_i686=('12d53dfd77e4c46857923c2b4442a30d23980e18587227b0fb835e7eceea1382')
sha256sums_x86_64=('caa0ab4d6d2583de7b6e89289bc91981e029ddb851a9e7be040531d88d4788cc')
sha256sums_armv7h=('7e52402752ed96a81972e25107d91db1f547a458a5dbe194a36b984090793549')
sha256sums_aarch64=('579b4cda07a99ef0cab543ddb2b2f1d48611abb29494a30e30c269ef8654f46d')
sha256sums_loong64=('307d0ea661859b9e5dd863f9b02317cb570678f16ba254adfc2177f7dd75322f')
sha256sums_riscv64=('c249e8240ef89038e42817f7285ffab40646c7dc57c3e109c4cd8f9d36df4d9f')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
