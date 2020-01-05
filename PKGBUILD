# Maintainer: Sharky <sharky@sharky.pw>

pkgname=surfshark-vpn
pkgver=1.1.0
pkgrel=1
pkgdesc="Surfshark VPN client"
arch=('x86_64')
url="https://surfshark.com/download/linux"
license=('custom:surfshark')
depends=(glibc openvpn)
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark-vpn/surfshark-vpn_${pkgver}_amd64.deb")
sha256sums=('07afd9b77bf2fd9d53fe46481b13623727ae32813d99aff32d23e14e00404f72')

prepare() {
    tar xf data.tar.xz
    gunzip -f usr/share/doc/surfshark-vpn/changelog.gz
}

package() {
    install -Dm 755 "${srcdir}/usr/bin/surfshark-vpn" -t "${pkgdir}/usr/bin/"
    install -Dm 644 "${srcdir}/usr/share/doc/surfshark-vpn/changelog" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
