pkgname=tor-relay-scanner-bin
pkgver=1.0.2
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
b2sums=(4d74eec76d7449469b1a74b85060548f5917bfd339de73c18749dd7a6e4a1c664d98ace97ee563b00064fd8e83736dddbdd70bd541ab7ab15f2bcf9f20e87e00
	e2c311b8615b2f6061effdd1028e65492f603767b6d2b172fce336763a52cb6f14a978e622d7432aba168a275f2530812d37a3a848ce7c5c545f83b6c96da9c4)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 tor-relay-scanner.service -t $pkgdir/usr/lib/systemd/system
}
