# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
# Contributor: Arch Linux Community
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=4.8.23
build=build.269.1+g5a09567
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.net"
depends=('iproute2' 'psmisc' 'libxkbcommon-x11')
optdepends=('wireguard-tools: wireguard support')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
sha256sums=('8790d6d99f69cd201d8bc8c30d117777601bb1934bc186412d332b81dd79b92a')
install=torguard.install

package() {
        bsdtar -xf "${srcdir}/torguard-v${pkgver}-${build}-amd64-arch/torguard-v${pkgver}-${build}-amd64-arch.tar" -C "$pkgdir" -s"/torguard-v${pkgver}-${build}-amd64-arch//"

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
