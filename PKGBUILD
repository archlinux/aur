# Maintainer: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-meta-bin
pkgver=1.15.1
pkgrel=1
pkgdesc="Another Clash Kernel by MetaCubeX"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/MetaCubeX/Clash.Meta"
license=("GPL3")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("clash-meta")
conflicts=("clash-meta")
replaces=()
backup=("etc/clash-meta/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("clash-meta.service"
        "clash-meta@.service"
        "config.yaml")
source_i686=("${pkgname}-i686-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-386-v${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-amd64-compatible-v${pkgver}.gz")
source_arm=("${pkgname}-arm-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv5-v${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv6-v${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-armv7-v${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-arm64-v${pkgver}.gz")
sha256sums=('9e8a28e22c159d7d70c258b65f47bc734543e54cb0cd3957ce19349aca145af8'
            '29c73ac66d6fe60bea4359ac1857e3452f26c2af792efd8dd16d558462472efb'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')
sha256sums_i686=('ebd51c0c1d09e599e2f95e10b866579ec0004179bc09ca06b086f014d616eb8a')
sha256sums_x86_64=('bc37d69614ad805924bd80149bb126a29f01882a5808e06f727760be9e534929')
sha256sums_arm=('8e5e7fd4428f615b29eb6427fa73a67a78f22d58a3d9e553b776acd24071f9a3')
sha256sums_armv6h=('7d7fe6ae598075d9043bc63bf202a71d5e181d77824c85a6cfceea7fc974c119')
sha256sums_armv7h=('d7382ffafef5820f0ee4a84d1d075c2ea6dc003fa93a0367146e5b583ac5e3d2')
sha256sums_aarch64=('0de2ec6748d0c5657cf7cf998596cc12de92907be86c3f7e0839e2548a4c4c6d')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-v${pkgver}" "${pkgdir}/usr/bin/clash-meta"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-meta/config.yaml"
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
    install -Dm644 "clash-meta@.service" "${pkgdir}/usr/lib/systemd/system/clash-meta@.service"
}
