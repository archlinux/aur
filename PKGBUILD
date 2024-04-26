# Maintainer: Adam <dev@goshawk22.uk>
# Maintainer: Sharky <sharky@sharky.pw>
# Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=surfshark-vpn-cli-bin
pkgver=1.1.0
pkgrel=4
pkgdesc="Surfshark VPN cli client"
arch=('x86_64')
url="https://surfshark.com/download/linux"
license=('custom:surfshark')
depends=(glibc openvpn)
conflicts=(surfshark-vpn)
provides=(surfshark-vpn)
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark-vpn_${pkgver}_amd64.deb")
sha256sums=('5ef76e6a9f61272ff927ccd965fce4b752de1083c3c4b25aecee513515cca819')

prepare() {
    tar xf data.tar.xz
    gunzip -f usr/share/doc/surfshark-vpn/changelog.gz
}

package() {
    install -Dm 755 "${srcdir}/usr/bin/surfshark-vpn" -t "${pkgdir}/usr/bin/"
    install -Dm 644 "${srcdir}/usr/share/doc/surfshark-vpn/changelog" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
