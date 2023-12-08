# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.17.0
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
sha256sums_i686=('fca602884222d0856f06116e22037168a4827763441e39b7b9573f96c733df95')
sha256sums_x86_64=('b0136a2cb1c359f52508514d846c921434affaf3a0a22b61f4560eff4e9cb836')
sha256sums_arm=('cef6b73353c0022959212e500d6e09d143a636f4f81da490305921b015d671c4')
sha256sums_armv6h=('356867ef03cc3099af9c4da28500f13115af6ef65516cbebb110e98a4215aa64')
sha256sums_armv7h=('74f0e57e1e05e9a683421ee44957c948b9a16d01dad8560b6176aae8c048ea18')
sha256sums_aarch64=('43dd07fe406bcbbadad0de4cb00b3083c77422f431f77aa089d4a95b59c5b42e')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
