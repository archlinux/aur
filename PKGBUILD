# Maintainer: ABOhiccups <info@abohiccups.com>
# Contributor: Arch Linux Community
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=4.8.26
build=build.276.1+gbbc0efd
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.net"
depends=('iproute2' 'psmisc' 'libxkbcommon-x11')
optdepends=('wireguard-tools: wireguard support')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
sha256sums=('56c1e775106600c67cdbee9aeddd8ec69e95e8c96ae4d2e83ae184d9bc58e600')
install=torguard.install

package() {
        bsdtar -xf "${srcdir}/torguard-v${pkgver}-${build}-amd64-arch/torguard-v${pkgver}-${build}-amd64-arch.tar" -C "$pkgdir" -s"/torguard-v${pkgver}-${build}-amd64-arch//"

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
