pkgname=snowflake-pt-client-bin
pkgver=2.14.1
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1620354/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(8f39d0465703f617daf65d1140abe47b2c93a65741ff0f00ec2852e4ad74f8241c6eccd81a1cce052e17c933f719f4add31b60392f0bd43933f3e70a03b3deb3
	454c607e32d8b7d868dbe2237bfd006ca6399bac0200d5693906b4d6679e661e2b6fcf569ded7d198cc1e5c899d9bcb27c5c26ee354ad46bd27e020f9f4304a3)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
