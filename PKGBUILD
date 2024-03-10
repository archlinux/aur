# Maintainer: sakul987 <sakul987@proton.me>
pkgname='wg-container'
pkgver=2.1
pkgrel=1
pkgdesc="Run specific applications in a WireGuard VPN"
arch=('any')
url="https://github.com/sakul987/wg-container"
license=('GPL-3.0-only')
depends=('bash' 'sudo' 'coreutils' 'grep' 'gawk' 'iproute2' 'iptables' 'ufw' 'sed' 'wireguard-tools')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sakul987/wg-container/archive/${pkgver}.tar.gz")
sha256sums=('7a96dec27129ea7b2be3780ad9558e3d09a8f2946ddd0e2c964a62a0fa1c0513')

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 wg-container "$pkgdir/usr/bin/wg-container"
    install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
