# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.1.0_6
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
sha256sums_i686=('e7910012e84cc8507daf953bcfe074b5dab904296d87062801607d7ada848228')
sha256sums_x86_64=('22f882cb1b77a560d62943617820d340961729f73d8cb82ba07914aca587e847')
sha256sums_armv7h=('dcf0063089f819d14657339b68f98adcb0a64f6238190da328158ad297b0813a')
sha256sums_aarch64=('fbc5b80d9d58fb012d526c32857bf88cd353e8ac47507729b17988e14741be14')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
