## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=clash-meta-bin
pkgver=1.10.0
pkgrel=2
pkgdesc="Clash Meta binary provided by MetaCubeX"
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
source=("${pkgname}-v1-${pkgver}.gz::${url}/releases/download/v${pkgver}/Clash.Meta-linux-amd64v1-v${pkgver}.gz"
        "clash-meta.service"
        "config.yaml")
sha256sums=('3fcce7982c32bab135334e9a53cb0ec9e53f1766af626b0c2c50023c815969e4'
            '83377618a3b381348f274f48bc40e2ba8b17a4f17dc8e9f5b16d76404c34ae8d'
            '8fe0a2163ef5a1ac6ab0692921816187350d05d5f1cc4613080d7facb36eedc8')

package() {
    cd ${srcdir}
    install -Dm755 "${pkgname}-v1-${pkgver}" "${pkgdir}/usr/bin/clash-meta"
    install -Dm644 config.yaml "${pkgdir}"/etc/clash-meta/config.yaml
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
}
