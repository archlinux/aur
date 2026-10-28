pkgname=snowflake-pt-client-bin
pkgver=2.15.2
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1784931/artifacts/raw/snowflake-v$pkgver.tar.gz
        snowflake)
b2sums=(5c10c3ad7fea6513d016cf1fa6d18aab14bee371ee99739a630e8c62c75a4c387eb95f3ff1d670017cd80436e7011bfc9028a86fb819c1ff2ef00ee58b388085
        07e13ed1a95751ec66396a9af1d5977dc6e5bc1a6cf10731819db16f40186778beac73fcd6cf09711326bbbf2fb185eb33f1798a670785474a6458ee2ce95fbe)

package() {
    install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
    install -Dm 644 snowflake -t $pkgdir/etc/tor
    install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
    install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
