# Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=clash-meta-bin
pkgver=1.11.2
pkgrel=0
pkgdesc="Another Clash Kernel by MetaCubeX"
arch=("x86_64")
url="https://github.com/MetaCubeX/Clash.Meta"
license=("unknown")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("clash-meta")
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("${pkgname}-amd64-v${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-amd64-compatible-v${pkgver}.gz"
        "clash-meta.service"
        "clash-meta@.service"
        "config.yaml")
sha256sums=('fdd6a00b5a04470f9bc4fbb7ba1b79b48ec64cdec6b0441ee05694704aab3a1d'
            '9e8a28e22c159d7d70c258b65f47bc734543e54cb0cd3957ce19349aca145af8'
            '29c73ac66d6fe60bea4359ac1857e3452f26c2af792efd8dd16d558462472efb'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-amd64-v${pkgver}" "${pkgdir}/usr/bin/clash-meta"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-meta/config.yaml"
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
    install -Dm644 "clash-meta@.service" "${pkgdir}/usr/lib/systemd/system/clash-meta@.service"
}
