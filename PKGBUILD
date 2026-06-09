pkgname=snowflake-pt-client-bin
pkgver=2.14.0
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1584558/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(af3685fabcf31f08d99a64ddd2c91561194ff211a924c802471ab137e5089f70fca07477772f0c15889d4e2045089e5279e5b87a48cd9c14680c6cb6eb6e045e
	454c607e32d8b7d868dbe2237bfd006ca6399bac0200d5693906b4d6679e661e2b6fcf569ded7d198cc1e5c899d9bcb27c5c26ee354ad46bd27e020f9f4304a3)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
