pkgname=snowflake-pt-client-bin
pkgver=2.13.1
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1471331/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(3abea34d9de565349b4edcabf852a04523b00bbac2484165809f1360ebbb84277e992c89424c395576a69f4e4085834095e1199068b30b67fc3d73a3d2c7494b
	7ab7867e286029bbb672dd619e4a823c09f98dd35d86ac57c8849e026d1f2de42f56d3912f282b73338b87076d1cfc1864a9c776cfdde62c5d392c51f8517763)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
