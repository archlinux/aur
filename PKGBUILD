# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=linux-router
pkgver=0.6.6
pkgrel=1
pkgdesc='Set Linux as router in one command'
url='https://github.com/garywill/linux-router'
arch=('any')
license=('LGPL')
depends=('bash' 'procps-ng' 'iproute2' 'dnsmasq' 'iptables')
optdepends=(
  'hostapd: WiFi hotspot capability',
  'iw: WiFi hotspot capability',
  'iwconfig: if 'iw' can not recognize your adapter',
  'haveged: improve random entropy',
  'qrencode: QR code support')
provides=('lnxrouter' 'linuxrouter')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('252bace54313f7a04bdddcc7b13b6b860b74074b6605b87a8886d4f58b29b341')
md5sums=('4216f81b02da68b2208a886ad8ec2725')


package() {
  cd "$pkgname-$pkgver"
	install -Dm755 lnxrouter -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lnxrouter"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/lnxrouter"
}


# vim: ts=2 sw=2 et:
