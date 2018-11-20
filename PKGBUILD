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
sha256sums=('5fb4f832ce7997b34f90a0671bf3806b44d35c5c24a664d06b40234999dd97d4')

package() {
    bsdtar -O -xf "nordvpn_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
}
