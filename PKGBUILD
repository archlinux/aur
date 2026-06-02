# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=vpn-shell
pkgver=1.0.0
pkgrel=1
pkgdesc='Start VPN for a single shell, or run a single command using WireGuard VPN without starting it system-wide'
arch=(any)
url='https://github.com/pakhromov/vpn-shell'
license=(MIT)
depends=(bash wireguard-tools iproute2 iputils util-linux sudo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pakhromov/vpn-shell/archive/v$pkgver.tar.gz")
sha256sums=('952e7f0c97aad1e284e2cf7928c8a85f8d580df8623632c89617517cdc430faf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 vpn-shell  "$pkgdir/usr/bin/vpn-shell"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
