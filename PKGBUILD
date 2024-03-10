# Maintainer: sakul987 <sakul987@proton.me>
pkgname='wg-container'
pkgver=2.0
pkgrel=1
pkgdesc="Run specific applications in a WireGuard VPN"
arch=('any')
url="https://github.com/sakul987/wg-container"
license=('GPL-3.0-only')
depends=('bash' 'sudo' 'coreutils' 'grep' 'gawk' 'iproute2' 'iptables' 'ufw' 'sed')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sakul987/wg-container/archive/${pkgver}.tar.gz")
sha256sums=('1a29811370fcd52766cc10205fdb3f19dc8a1364eb2391218876617266779385')

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 wg-container "$pkgdir/usr/bin/wg-container"
    install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
