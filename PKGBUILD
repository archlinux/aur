# Maintainer: erkexzcx <aur at erkexzcx dot com>

pkgname=nordvpn-cli
pkgver=3.3.1_1
pkgrel=1
pkgdesc="Official NordVPN CLI for Linux"
arch=('x86_64' 'aarch64' 'armv6h' 'arm' 'armv7h' 'i686')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('net-tools' 'libxslt' 'iptables' 'procps' 'iproute2')
optdepends=('wireguard-tools: nordlynx support' 'wireguard-module: nordlynx support')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-cli.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_amd64.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_arm64.deb")
source_armv6h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_armel.deb")
source_arm=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_armel.deb")
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_armhf.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.3.1-1_i386.deb")
sha256sums_x86_64=("2cfadc4475c1061bf3d194a5d0faef1d89be7fd61392339304b9f24c52b7aa10")
sha256sums_aarch64=("84ff8272f33f5c4668c666abf1ebfeafe28257675004d54b1e7775b674fc2db3")
sha256sums_armv6h=("37ae23fb364f824dfc22bb798450870e246d6b34f11ff3c3127225d05f4fce57")
sha256sums_arm=("37ae23fb364f824dfc22bb798450870e246d6b34f11ff3c3127225d05f4fce57")
sha256sums_armv7h=("4140d53d231050055ff0cedd9d50613f605bc82cb7478df1eee9f1fb4a988f6c")
sha256sums_i686=("90277bbbcfb76eca4f891b125571373c9f1fd2b743fde390df8ee3bc3c8238c2")

package() {
	bsdtar -O -xf *.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

	mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/etc/init.d"
	rm -r "${pkgdir}/usr/sbin"
}
