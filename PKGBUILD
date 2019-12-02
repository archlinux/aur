# Maintainer: Sharky <sharky@sharky.pw>

pkgname=surfshark-vpn
pkgver=1.0.0
pkgrel=1
pkgdesc="Surfshark VPN client"
arch=('x86_64')
url="https://surfshark.com/download/linux"
license=('custom:surfshark')
depends=(glibc openvpn)
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark-vpn/surfshark-vpn_${pkgver}_amd64.deb")
sha256sums=('0e11d87113bc7adfdcaa0ee2e66bebedb3f1964f897eb6552057e91282629f56')

prepare() {
    tar xf data.tar.xz
    gunzip -f usr/share/doc/surfshark-vpn/changelog.gz
}

package() {
    install -Dm 755 "${srcdir}/usr/bin/surfshark-vpn" -t "${pkgdir}/usr/bin/"
    install -Dm 644 "${srcdir}/usr/share/doc/surfshark-vpn/changelog" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
