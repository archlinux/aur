# Maintainer: ABOhiccups <info@abohiccups.com>
# Contributor: Arch Linux Community
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=4.8.27
build=build.279.1+g646a896
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.net"
depends=('iproute2' 'psmisc' 'libxkbcommon-x11')
optdepends=('wireguard-tools: wireguard support')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
sha256sums=('a37d32c1d82c5dd708255c7a364501b9bcd6c83580724d2569a65e53726f5942')
install=torguard.install

package() {
        bsdtar -xf "${srcdir}/torguard-v${pkgver}-${build}-amd64-arch/torguard-v${pkgver}-${build}-amd64-arch.tar" -C "$pkgdir" -s"/torguard-v${pkgver}-${build}-amd64-arch//"

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
