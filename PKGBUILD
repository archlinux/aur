# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
# Contributor: Arch Linux Community
# Contributor: TorGuard Support <support@torguard.com>
pkgname=torguard
pkgver=4.8.17
build=build.242.1+gcefc4e9
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="https://www.torguard.net"
depends=('iproute2' 'psmisc' 'libxkbcommon-x11')
optdepends=('wireguard-tools: wireguard support')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
sha256sums=('f4b6d999ed0db54739e261d2ab44afdde7bbb87ba84f71670a61baa291cbcfc0')
install=torguard.install

package() {
        bsdtar -xf "${srcdir}/${pkgname}-v${pkgver}-${build}-amd64-arch/torguard-v${pkgver}-${build}-amd64-arch.tar" -C "$pkgdir" -s"/torguard-v${pkgver}-${build}-amd64-arch//"

	install -d "$pkgdir"/usr/bin/
	ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
