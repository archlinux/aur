# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.23.5
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('f8a9a5d1c437c40ea429c711bc89cb7528939edb2afd4513df91db2ca8d72936b046fcc276b709832640ebbad7b9d99220f5cd325d9b206b9ef7f174db764782'
        '74d931aa8575fff172a59bf67b62f955bdfe002f3db3c708aa051cda74f94374e6fb4a61a64f023e83ff2f2759672e280565da18f28e99225d09316dba29ce2f')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
