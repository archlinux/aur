pkgname=snowflake-pt-client-bin
pkgver=2.8.1
pkgrel=1
pkgdesc='Pluggable Transport using WebRTC, inspired by Flashproxy'
url=https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake
arch=(x86_64)
depends=(tor)
optdepends=(tor-browser)
backup=(etc/tor/snowflake)
install=$pkgname.install
source=(snowflake-v$pkgver.tar.gz::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/jobs/441747/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)

b2sums=(a330fd8f4c8b7858dcdf58865a84f0fda8d3c8ce6b8d2e8e9b50a041349d0e3c8de7f028275bc33344cd1e4060572d64a26b1922f94ad01adc75bacfb2caf057
	915b0d931ce5766267764bc5355d670f134587b794df07e524ce2c7a35fef097cac7ba037644cdf8887b102139d317090cdfe3cd0d840a8cdee23bc8def0b6bb)

package() {
	install -Dm 755 $srcdir/snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake $pkgdir/etc/tor/snowflake
	install -Dm 644 $srcdir/snowflake-v$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
