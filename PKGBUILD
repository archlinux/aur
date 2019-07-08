# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.2.0_2
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
sha256sums_i686=('d7dcd56e3341aeebf2cfea646617c0f679d6822af77000532d00b69d87fbf236')
sha256sums_x86_64=('c069d71f6b3fa40b27be1a7a1c842a114fdbf1dce8dbb94cb761e5fa3078599c')
sha256sums_armv7h=('a20d7ad653790d03fb5791494951e07c41609b842ac1ddb6e1abb7710fbe7e93')
sha256sums_aarch64=('a755669ac26edc87a9120f2f20a0d7127d1e548c089a0ff5ef7949af675595f6')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
