# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.0
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
sha256sums_i686=('207b25a13c19e1cc677db971be2ba316f90cd79ed91423f8b78eae5a828f8ff7')
sha256sums_x86_64=('be743f8c04b8af8911086618fa2ca9c52bed414658266d1ba8e2ab78ad4e7b60')
sha256sums_armv7h=('5ceaef8a7614cee82b341f413399f38af8c2ef21b7a4476644520cc46df71dcf')
sha256sums_aarch64=('d43f5b44793e4dfa2b60feef15c35c7ac03e7593997f6fe981eb31091edbb957')
sha256sums_loong64=('d8d9c751b606bae9a5eae06c5028c556c1eb3e5e58453d25d78a182a3178d09e')
sha256sums_riscv64=('f767982b204acb697cc635869d29edc86f0c891dde0c11f50db74f4308629642')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
