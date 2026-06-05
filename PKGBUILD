# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=vpn-shell
pkgver=1.0.1
pkgrel=1
pkgdesc='Start VPN for a single shell, or run a single command using WireGuard VPN without starting it system-wide'
arch=(any)
url='https://github.com/pakhromov/vpn-shell'
license=(MIT)
depends=(bash wireguard-tools iproute2 iputils util-linux sudo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pakhromov/vpn-shell/archive/v$pkgver.tar.gz")
sha256sums=('2ae0224ce7a7567f195be548bac8ae46ad2e4360690e0148b6083030c564a085')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 vpn-shell  "$pkgdir/usr/bin/vpn-shell"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
