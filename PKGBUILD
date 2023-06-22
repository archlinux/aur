# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=linux-router
pkgver=0.6.7
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
md5sums=('486e4a6d5c202085f0f9367c5207d3e8')
sha256sums=('94d26e9e3bbe9b2bfe5b1b09fcb6237cf4623ad22f8b7698af2193e2ab78c338')


package() {
  cd "$pkgname-$pkgver"
	install -Dm755 lnxrouter -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lnxrouter"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/lnxrouter"
}


# vim: ts=2 sw=2 et:
