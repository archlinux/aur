# Maintainer: sakul987 <sakul987@proton.me>
pkgname='wg-container'
pkgver=2.2
pkgrel=1
pkgdesc="Run specific applications in a WireGuard VPN"
arch=('any')
url="https://github.com/sakul987/wg-container"
license=('GPL-3.0-only')
depends=('bash' 'sudo' 'coreutils' 'grep' 'gawk' 'iproute2' 'iptables' 'ufw' 'sed' 'wireguard-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sakul987/wg-container/archive/${pkgver}.tar.gz")
sha256sums=('9cb3f20d4b4884d2342281ff176349539ddc0cbf5e59b9ee4c9b8a06e85a2c44')

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 wg-container "$pkgdir/usr/bin/wg-container"
    install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
