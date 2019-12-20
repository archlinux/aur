# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.5.0_2
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
sha256sums_x86_64=('81d864b5c9a8afd61cf2cfd77dbac11ee8ebae573623e88ee315fc9830396b85')
sha256sums_i686=('edb45e305e9423783e843d1dfe510f8987354fca4e215ca4b7da72b74f8a40fa')
sha256sums_arm=('d6f86513ee0c1139dd340cce32982def3cdc13e4d02a20f03c64c1e4ff3cd4e7')
sha256sums_armv6h=('d6f86513ee0c1139dd340cce32982def3cdc13e4d02a20f03c64c1e4ff3cd4e7')
sha256sums_armv7h=('3207e6f23e295224d7cf02ecf08e235afe4e5ba3905a3fd95d6c9fe9d27c01c9')
sha256sums_aarch64=('1c904b29b2f8cef17ea91d9f4fa8664328733790d0213dab172a5660d018d3d7')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
