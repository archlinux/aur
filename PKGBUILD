# Maintainer: metiis <aur at metiis dot com>
# Maintainer: Julio Gutierrez <bubuntux at gmail dot com>
# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
pkgver=3.6.0_5
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
sha256sums_x86_64=('e3bef9375965df521bd0fd30ac1672f4a532846f7735e10086b4952853fa836e')
sha256sums_i686=('cda0600f012ac36d08bb1583a42c3825b44f9c71da1eac8664948d6efff1d6ec')
sha256sums_arm=('5fe194797b84af83accca88df9b1f687a6d46567dd296e76767230fd7e59ef24')
sha256sums_armv6h=('5fe194797b84af83accca88df9b1f687a6d46567dd296e76767230fd7e59ef24')
sha256sums_armv7h=('d09bc9fda81158d04bae686c46633f47bdc329aaae8d4d23240598f09924cb8a')
sha256sums_aarch64=('73d2df564c3539b1fb31c77ae23303cd1151ca318fd0e4a36f58be930d0aa8b0')

package() {
    bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
}
