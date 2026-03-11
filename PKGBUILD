pkgname=snowflake-pt-client-bin
pkgver=2.12.1
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1413878/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(abc00c5232da56d8a19104c75211aa71360cd3f01d8b66888b435027323c8c724183e64520c1cec08ba3075a934967e294f415c62fd41812b76ab3f2d558f602
	7ab7867e286029bbb672dd619e4a823c09f98dd35d86ac57c8849e026d1f2de42f56d3912f282b73338b87076d1cfc1864a9c776cfdde62c5d392c51f8517763)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
