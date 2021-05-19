# Maintainer: Jean-Claude Graf <jeanggi90[at]gmail[dot]com>

pkgname=linux-router
pkgver=0.6.0
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
sha256sums=('a75085b09a04447915eebe22a964500d1bcba64daf55e2fecf704431c89099c4')
md5sums=('bc885da3762d9be7123842b65b4bdb32')


package() {
  cd "$pkgname-$pkgver"

	install -Dm755 lnxrouter -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lnxrouter"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/lnxrouter"
}


# vim: ts=2 sw=2 et:
