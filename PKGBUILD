# Maintainer: Jean-Claude Graf <mail@jeanclaudegraf.ch>
pkgname=linux-router
pkgver=0.8.2
pkgrel=1
pkgdesc='Set Linux as router in one command'
url='https://github.com/garywill/linux-router'
arch=(any)
license=(LGPL-2.1-only)
depends=(bash procps-ng iproute2 dnsmasq iptables)
optdepends=(
  'hostapd: WiFi hotspot capability',
  'iw: WiFi hotspot capability',
  'iwconfig: if "iw" can not recognize your adapter',
  'haveged: improve random entropy',
  'qrencode: QR code support')
provides=(lnxrouter linuxrouter)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b5588c5cf57093cd30d98bd4ef66c0764927d232b3f6db0b18e20ee5e6bc1e8')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 lnxrouter -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lnxrouter"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/lnxrouter"
}

# vim: ts=2 sw=2 et:
