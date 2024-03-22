# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=mihomo-bin
pkgver=1.18.1
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
sha256sums_i686=('80618a962298ffb6df132589cba4831a815b5900b8721210a192152ca0cefbc2')
sha256sums_x86_64=('23d1298e7494389ee4d7410ce94054342eab224171cd0269b255486f93669351')
sha256sums_arm=('39fdb4e383ee1524c9bc565a15ba0a59a46badc9a79f8e49be1d1f63ad22278d')
sha256sums_armv6h=('94213298f5e9d2c28ad120346849a8317ff63f919a1952384c8be28829b88472')
sha256sums_armv7h=('542254696a93f34a1a39a87c73aa5125dba7695f3a66af9694c3a562980318c7')
sha256sums_aarch64=('ef90e8d67858041614438a5976c983ea3a1433b858c8260826ab3b8f1da82abf')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
    install -Dm644 "mihomo@.service" "${pkgdir}/usr/lib/systemd/system/mihomo@.service"
}
