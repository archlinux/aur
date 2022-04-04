## Maintainer: adiprasetya <ignilium.inc@gmail.com>

pkgname=clash-meta-bin
pkgver=v1.10.0
pkgrel=1
pkgdesc="Clash Meta binary provided by MetaCubeX"
provides=("clash")
conflicts=("clash" "clash-tun" "clash-dev-git" "clash-premium-bin" "clash-premium-tun")
arch=("x86_64")
url="https://github.com/MetaCubeX/Clash.Meta"
license=("unknown")
depends=("glibc")
install=${pkgname}.install
source=("${pkgname}-x86_64v1-${pkgver}.gz::${url}/releases/download/${pkgver}/Clash.Meta-linux-amd64v1-${pkgver}.gz"
        "clash.service"
        "config.yaml")
sha256sums=('722391375a5c66d650cdb0012e0fea69b8a3706a03198329af089fde1088d812'
            'e68448a05f9641bacee58ff40cca4eb1523f5c840550eb01b7c2904d4bbe6603'
            '8fe0a2163ef5a1ac6ab0692921816187350d05d5f1cc4613080d7facb36eedc8')

package() {
    cd ${srcdir}
    install -Dm755 "${pkgname}-${CARCH}v1-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm 644 config.yaml "${pkgdir}"/etc/clash/config.yaml
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}
