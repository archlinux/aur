pkgname=tor-relay-scanner-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python tor)
optdepends=(torbrowser-launcher)
options=(!debug)
install=$pkgname.install
source=(tor-relay-scanner-$pkgver.pyz::$url/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	tor-relay-scanner.service)
b2sums=(94aebe2483cadbf09893c7eab141a1d4f999a62022aef1a9872629146d3c3b758c8a723c942bd42f393a817a3d76aab7b6c72ec7316f8c60a01ba7066ab9ca09
	e2c311b8615b2f6061effdd1028e65492f603767b6d2b172fce336763a52cb6f14a978e622d7432aba168a275f2530812d37a3a848ce7c5c545f83b6c96da9c4)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 tor-relay-scanner.service -t $pkgdir/usr/lib/systemd/system
}
