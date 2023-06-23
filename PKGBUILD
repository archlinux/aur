pkgname=tor-relay-scanner-bin
pkgver=0.0.9
pkgrel=6
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python tor)
optdepends=(tor-browser)
install=$pkgname.install
source=(tor-relay-scanner-$pkgver.pyz::https://github.com/ValdikSS/tor-relay-scanner/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	update-tor-bridges.service)
b2sums=(5377ebdca8a70643a212e72c585b19c7397433c3701085db0c42cc8b6dc848144c56990ae028311f59135c7530f4e4d0e05949c2bb22e6a4bff779e96d4b8a75
	10bbe01d67e84fd614dd6dddb855040d117b1cd7cdb326e9680b43233dc56fbae62e11a8a8c59e71947a9842f87802a1591c3b94cf8d529568c7701358421ec2)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 update-tor-bridges.service $pkgdir/usr/lib/systemd/system/update-tor-bridges.service
}
