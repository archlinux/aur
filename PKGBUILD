# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hojjat Ali Mohammadi <safeith@gmail.com>

pkgname=cyberghostvpn
pkgver=1.4.1
pkgrel=1
pkgdesc="CyberGhost VPN"
url="https://www.cyberghostvpn.com"
arch=(any)
license=(custom:cyberghostvpn)
depends=(
  curl
  openvpn
  wireguard-tools
  systemd-resolvconf
)
makedepends=(zip)
install="${pkgname}.install"

source=("https://download.cyberghostvpn.com/linux/cyberghostvpn-ubuntu-20.04-${pkgver}.zip")
sha256sums=('355ab80f3445968161f6db9565857a9af8df61fd6292b4c4267579ff128f3007')

package() {
	mkdir -p "$pkgdir/opt/cyberghost"

	install -m 755 "$srcdir/${pkgname}-ubuntu-20.04-${pkgver}/cyberghost/cyberghostvpn" "$pkgdir/opt/cyberghost/"
	install -m 755 "$srcdir/${pkgname}-ubuntu-20.04-${pkgver}/cyberghost/update-systemd-resolved" "$pkgdir/opt/cyberghost/"
}
