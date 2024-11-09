pkgname=snowflake-pt-client-bin
pkgver=2.10.0
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/747367/artifacts/raw/snowflake-v$pkgver.tar.gz
	snowflake)
b2sums=(42198459d7150c8143714fd01e51cf6cdf61bb2b533349e8a6572e23b029dfa2ee8ea0a8611df10d4280c149c37bb24eb28b9a8e3466dcc61e8ada2036bead70
	b4c733fa9e8430316e5f0fa45ae79725ffead99a32dc45eecf36b7acbf67493aa16ea4e53a88f2eedec15cc7c47e041ee3ebceba7a0136e91f5678deb286649b)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
