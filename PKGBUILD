pkgname=snowflake-pt-client-bin
pkgver=2.11.0
pkgrel=1
pkgdesc='Pluggable Transport using WebRTC, inspired by Flashproxy'
url=https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake
arch=(x86_64)
license=(BSD-3-Clause)
depends=(tor)
optdepends=(torbrowser-launcher)
backup=(etc/tor/snowflake)
install=$pkgname.install
options=(!debug)
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/898266/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(9d9876cd98e2346dde99be2fe134057743a68e9b4cb1480fa477839386188acc8c9ba789f80360ea17bdb2c995c07f76bb6782e36610bcb09cb88424fd36dc8c
	7ab7867e286029bbb672dd619e4a823c09f98dd35d86ac57c8849e026d1f2de42f56d3912f282b73338b87076d1cfc1864a9c776cfdde62c5d392c51f8517763)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
