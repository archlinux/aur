pkgname=tor-relay-scanner-bin
pkgver=1.0.0
pkgrel=3
pkgdesc='Tor relay availability checker'
url=https://github.com/ValdikSS/tor-relay-scanner
arch=(x86_64)
depends=(python tor)
optdepends=(torbrowser-launcher)
install=$pkgname.install
options=(!strip)
source=(tor-relay-scanner-$pkgver.pyz::$url/releases/download/$pkgver/tor-relay-scanner-$pkgver.pyz
	update-tor-bridges.service)
b2sums=(5259c833d3447ae4044b4382178fbf321f6f56193847f1f195c8f197153569de41861c9af088e2de45b85b4a66107f14510e98c6e3a9de46a2faed491b732aba
	10bbe01d67e84fd614dd6dddb855040d117b1cd7cdb326e9680b43233dc56fbae62e11a8a8c59e71947a9842f87802a1591c3b94cf8d529568c7701358421ec2)

package() {
	install -Dm 755 tor-relay-scanner-$pkgver.pyz $pkgdir/usr/bin/tor-relay-scanner
	install -Dm 644 update-tor-bridges.service -t $pkgdir/usr/lib/systemd/system
}
