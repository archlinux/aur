# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.0.1_1
pkgrel=2
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
sha256sums_i686=('300c396d73ff7f779c776cdee4e3ff4078c712c11f29e2763f352dbae19566ac')
sha256sums_x86_64=('51b70b8af4593aa268fc3f51260351dcf44510a82f02c63d7f312441f19aa992')
sha256sums_armv7h=('dce7aa7b7777206e4bb996ae96b76add658e11beabad35330876280b20fb146c')
sha256sums_aarch64=('e526eef4a8c67a5dff7ba163e8909feedda14b9750f6f642dc3cecb285127503')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnsd" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/sbin/nordvpnud" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
}
