# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.19.1
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
sha256sums_i686=('a260dcdd9821ceb042e558fd1912dabf45db66f33a5d8352a6e82ceb5927f139')
sha256sums_x86_64=('e0d5114e3b7a74f213a2be98f2858b3f7bab80d5b5c2ecd42240dc391c83149b')
sha256sums_armv7h=('69af7311ff75efe9f782267694f0debdc6685d98107a2467dafa321d0a07c85a')
sha256sums_aarch64=('c427874468ddbadb5ecf7fb2bf2681370df5b41b0ed730d5c0e7b5d98c66953e')
sha256sums_loong64=('3d9c0cb8c983c054cf5c79890b08c63fed60aab86dec5ea74aeef3966f03bacd')
sha256sums_riscv64=('f9dae429e25a26898b75c0ed214d407e893a7df3813efc4fdd5dd208ff06d5af')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
