pkgname=nordvpn-bin
pkgver=2.0.0
pkgrel=3
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('openvpn' 'net-tools')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver}_amd64.deb")
sha256sums=('7013e7d0c9e51cc604147eafc61b5c47c05a3e347c47ff556b3d5ec7f3717831')

package() {
    bsdtar -O -xf "nordvpn_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
}
