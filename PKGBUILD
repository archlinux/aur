# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.6.1_1
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
optdepends=('wireguard-tools: nordlynx support' 'wireguard-arch: nordlynx support')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_arm=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb")
source_armv6h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armel.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('52bcea0a60920838246bf28f464a0c5cb20c19405288f0f117cbcfbefe3b515f')
sha256sums_i686=('ef929837e189b5f97e4d8dcfcbe3fdb94e6ceb934d090c352d8abf87cb5a1763')
sha256sums_arm=('c33a2370fbd48965337d1c34b68f79cb2644584e7c18cb924b5e7cb57ca19c15')
sha256sums_armv6h=('c33a2370fbd48965337d1c34b68f79cb2644584e7c18cb924b5e7cb57ca19c15')
sha256sums_armv7h=('5cc62f8ad5841f38daa6d389df9c64d28ba4d912428f596721c1490b1bbb2262')
sha256sums_aarch64=('9da6e1181845eac3bf69f8aec16a2f604e2b0a58b737efcf0282e21bf5a4f695')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
