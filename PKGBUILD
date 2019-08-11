# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.3.0_4
pkgrel=2
pkgdesc="NordVPN CLI tool for Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
optdepends=('wireguard-tools: nordlynx support' 'wireguard-module: nordlynx support')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_aarch64.deb")
sha256sums_i686=('64616b5d5891f5c07e34c2dc7db5e39c15a9aa51fa3a390112d9f49dc29b723d')
sha256sums_x86_64=('508722c2bb4943dad260ebbecd0af8d4d115330f55dbf2bc32f3b74a47f125a7')
sha256sums_armv7h=('71d1569c21e08555f47382fe01b4d1faa5d39425eb628c5e5f4f2c8eda0f83bf')
sha256sums_aarch64=('536fbbd7f387ea2d6b24839f62d0c55d2298a2f8dd0ab9f97632c2efc6009c18')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
