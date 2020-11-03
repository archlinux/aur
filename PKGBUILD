# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.8.6
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('libxslt' 'iptables' 'procps' 'iproute2' 'ipset' 'ca-certificates')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('5313a6d2813bc44aed2653ba08a63614a44bb2c568505e5e781d9b4de420c426')
sha256sums_i686=('cb2867848a82b6f5bb0fd54759a31d92bb9cfcde6b34e277ab367556ca8360a9')
sha256sums_armv7h=('3aa68bb0f5209a510bb29ad3cf66e93c42e4846ed28b0bdddae3536e35100326')
sha256sums_aarch64=('00e2f89f9c7b9261dc74b73e644f431b9db57c8327885856b82f35caaa707f8d')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
