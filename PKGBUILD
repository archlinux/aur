pkgname=tor-relay-scanner-bin
pkgver=1.0.0
pkgrel=4
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python tor)
optdepends=(torbrowser-launcher)
options=(!debug)
install=$pkgname.install
source=(tor-relay-scanner-$pkgver.pyz::$url/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	tor-relay-scanner.service)
b2sums=(5259c833d3447ae4044b4382178fbf321f6f56193847f1f195c8f197153569de41861c9af088e2de45b85b4a66107f14510e98c6e3a9de46a2faed491b732aba
	e2c311b8615b2f6061effdd1028e65492f603767b6d2b172fce336763a52cb6f14a978e622d7432aba168a275f2530812d37a3a848ce7c5c545f83b6c96da9c4)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 tor-relay-scanner.service -t $pkgdir/usr/lib/systemd/system
}
