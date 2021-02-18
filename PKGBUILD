# Maintainer: Hojjat Ali Mohammadi <safeith@gmail.com>
pkgname=cyberghostvpn
pkgver=1.3.4
pkgrel=1
pkgdesc="CyberGhost VPN"
url="https://www.cyberghostvpn.com"
arch=('any')
license=('custom:cyberghostvpn')
depends=('curl' 'openvpn' 'wireguard-tools' 'systemd-resolvconf')
makedepends=('zip')
install="${pkgname}.install"
source=("https://download.cyberghostvpn.com/linux/${pkgname}-ubuntu-20.04-${pkgver}.zip")
sha256sums=('d28d6008c71896bdb3af67d4d047eb4738e061e7cd5d2d9debef7e90b875fec5')

package() {
	mkdir -p "$pkgdir/usr/local/cyberghost"
	install -m 755 "$srcdir/${pkgname}-ubuntu-20.04-${pkgver}/cyberghost/cyberghostvpn" "$pkgdir/usr/local/cyberghost/"
	install -m 755 "$srcdir/${pkgname}-ubuntu-20.04-${pkgver}/cyberghost/update-systemd-resolved" "$pkgdir/usr/local/cyberghost/"
}
