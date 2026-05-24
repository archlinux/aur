# Maintainer: Kuro <kurojs>

pkgname=ovpngate
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal-based OpenVPN client for VPN Gate with server list, filters, and connection management"
arch=('x86_64')
url="https://github.com/kurojs/ovpngate"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o ovpngate ./cmd/ovpngate/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ovpngate "$pkgdir/usr/bin/ovpngate"
}
