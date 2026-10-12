pkgname=snowflake-pt-client-bin
pkgver=2.15.1
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1774608/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(49e214165316d61bb05fdb7e2d2ed9fe0211d6b806ffe0c262f137b947205238e90a42e2802ead46648f4413fce530f69f3302d39b467511ff97f071392a3c3c
	454c607e32d8b7d868dbe2237bfd006ca6399bac0200d5693906b4d6679e661e2b6fcf569ded7d198cc1e5c899d9bcb27c5c26ee354ad46bd27e020f9f4304a3)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
