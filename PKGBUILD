# Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=clash-meta-bin
pkgver=1.11.1
pkgrel=1
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
source=("${pkgname}-amd64v1-v${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-amd64v1-v${pkgver}.gz"
        "clash-meta.service"
        "clash-meta@.service"
        "config.yaml")
sha256sums=('0ece1323c05a4480c1ca56fd29a029e87e1f3f35639aaef68b7e5dd297890a9c'
            '9e8a28e22c159d7d70c258b65f47bc734543e54cb0cd3957ce19349aca145af8'
            '29c73ac66d6fe60bea4359ac1857e3452f26c2af792efd8dd16d558462472efb'
            '2c78744f372190f397bee787a9f287032a4d76505f1740a6bfe79035757d1f86')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-amd64v1-v${pkgver}" "${pkgdir}/usr/bin/clash-meta"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-meta/config.yaml"
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
    install -Dm644 "clash-meta@.service" "${pkgdir}/usr/lib/systemd/system/clash-meta@.service"
}
