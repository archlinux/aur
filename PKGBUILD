pkgname=nordvpn-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('openvpn')
options=('!strip')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver}_amd64.deb")
sha256sums=('21cb8cbc3f2e7fd071ff6ad1eedc6fcdc74b0d399582fea2759cbc35e0d65970')

package() {
    bsdtar -O -xf "nordvpn_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mkdir $pkgdir/usr/bin
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin

    rm -r $pkgdir/usr/sbin
}
