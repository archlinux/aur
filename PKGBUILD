pkgname=snowflake-pt-client-bin
pkgver=2.15.3
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/1797633/artifacts/raw/snowflake-v$pkgver.tar.gz
        snowflake)
b2sums=(192be173acc6f44c13dcc2c4512b73e348febb787bc76fe50cbce81e48b28fe547ad0f39909a22288443688c7bf9187b701d557947007228851fc0aea3caef9e
        07e13ed1a95751ec66396a9af1d5977dc6e5bc1a6cf10731819db16f40186778beac73fcd6cf09711326bbbf2fb185eb33f1798a670785474a6458ee2ce95fbe)

package() {
    install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
    install -Dm 644 snowflake -t $pkgdir/etc/tor
    install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
    install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
