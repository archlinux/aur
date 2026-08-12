pkgname=tor-relay-scanner-bin
pkgver=1.0.5
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
b2sums=(d057a36c81493271eccfb70b9fab078b53f38308892831a4143f4612892550828bc03945881043710d4895dad9b2ad203dc60479e223c7c3ddb62ce90edb41e7
	e2c311b8615b2f6061effdd1028e65492f603767b6d2b172fce336763a52cb6f14a978e622d7432aba168a275f2530812d37a3a848ce7c5c545f83b6c96da9c4)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 tor-relay-scanner.service -t $pkgdir/usr/lib/systemd/system
}
