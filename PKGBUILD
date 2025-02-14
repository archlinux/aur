# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.2
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
sha256sums_i686=('fc492c9da4dbdfeb4629caa8f730dce1e4db285f5e618dbbafa9221292dab418')
sha256sums_x86_64=('a0b2b347b30387c452e6a4cf531f55df8175f7998e91451a3083459948aa3cae')
sha256sums_armv7h=('56eb35dcd70b2ee055b78cedf6c52fa3b34f0a39af7b9fd1327aaade2f687444')
sha256sums_aarch64=('53fec69db3a925db9b060133586e6b8b607d8080c1ac3116d7b0d39f5fd72164')
sha256sums_loong64=('71e95a75ccd5cdb8565554e4b448606cf88aa37ef70bceb2be7e11b4ce4e1866')
sha256sums_riscv64=('82c7bcdc798ff9d32726d85c1debb68fe8ccde0f560a2a963252eb008cc7df90')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
