pkgname=nordvpn-bin
pkgver=1.2.0
pkgrel=3
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('openvpn')
options=('!strip')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver}_amd64.deb")
sha256sums=('386c4e36d42d2d5508d134e5640df9e5aaf7a8fd85fad66b4951296a2f393ff9')

package() {
    bsdtar -O -xf "nordvpn_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
