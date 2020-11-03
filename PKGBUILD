# Maintainer: Samim <psamim at gmail dot com>

pkgname=nordvpnteams-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="NordVPNTeams CLI tool for Linux"
arch=('x86_64')
url="https://nordvpnteams.com/download/linux/"
license=('custom')
depends=('libxslt' 'iptables' 'procps' 'iproute2' 'ipset' 'ca-certificates')
install="post.install"
provides=('nordvpnteams')
source_x86_64=("https://downloads.nordteams.com/linux/latest/debian/pool/main/nordvpnteams_${pkgver//_/-}_amd64.deb")
sha256sums_x86_64=("80546a19f170a951bc40eeb511d32ef71fab32e962c189afdbc49443727549fc")

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    mv "${pkgdir}/usr/sbin/nordvpnteamsd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/sbin"
    rm -r "${pkgdir}/var/run"
}
