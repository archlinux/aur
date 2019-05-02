# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.0.0_4
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' )
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_aarch64.deb")
sha256sums_i686=('2e00ae9e8cf5732a35712066ff72eac1e99149eb219e626151ec7f78be562ab1')
sha256sums_x86_64=('a4a9602a9ecc1b29eb4ef9667993bd68999f42fc1962588951845a797d31ecfa')
sha256sums_armv7h=('faa61bda229abcea5defcb4cbce92f09d269ffad2918de8f9d1529ce64d2b558')
sha256sums_aarch64=('a36d8f0249125912ca0a8655a9b1a5c5615245ee3a53cc0469913e9f11c2226a')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnsd" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/sbin/nordvpnud" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
}
