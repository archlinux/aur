# Maintainer: erkexzcx <aur at erkexzcx dot com>

pkgname=nordvpn-bin-maintained
pkgver=3.3.1_1
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux - maintained version"
arch=('x86_64' 'arm64' 'armv6h' 'armv7h' 'i386')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
optdepends=('wireguard-tools: nordlynx support' 'wireguard-module: nordlynx support')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_amd64.deb")
source_arm64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_arm64.deb")
source_armv6h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_armel.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_armhf.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_i386.deb")
sha256sums_x86_64=("7004158f43503238a90556331d3b845e6c67de6c0a0e5e406625f132418d1d14")
sha256sums_arm64=("40ed38281dd5c290148691890a0a5c37182a1b7dd4fdfcea6ef43081cf58beee")
sha256sums_armv6h=("428209f06543871d02a8a616e172f735b98c0d17f67a0f34fa2e103097c67df6")
sha256sums_armv7h=("681f23146b8ad5c46291d3a3058a8f179a6593cc18fa50187ce0d20d9659acc8")
sha256sums_i686=("79b835daf31f6348138e25aae3f46c6d2b344582d7ed67d45a10dcde02d1faf2")

package() {
	bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

	mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/etc/init.d"
	rm -r "${pkgdir}/usr/sbin"
}
