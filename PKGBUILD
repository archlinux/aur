pkgname=tor-relay-scanner-bin
pkgver=0.0.9
pkgrel=3
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python)
install=tor-relay-scanner-bin.install
source=(tor-relay-scanner-$pkgver.pyz::https://github.com/ValdikSS/tor-relay-scanner/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	update-tor-bridges.service)
b2sums=(5377ebdca8a70643a212e72c585b19c7397433c3701085db0c42cc8b6dc848144c56990ae028311f59135c7530f4e4d0e05949c2bb22e6a4bff779e96d4b8a75
	a5e2ed8ac03a233b767da86ffbd400117f00b29423147011f6d020107706eb9e97b87a7fa4db975f47c342f765801565751f14ec4d83470715969fd6b4df5c91)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 update-tor-bridges.service $pkgdir/usr/lib/systemd/system/update-tor-bridges.service
}
