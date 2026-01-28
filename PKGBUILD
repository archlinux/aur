# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.48
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse, Parquet and CSV]"
arch=(x86_64)
url='https://sql-studio.frectonz.et'
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('fc70aef9a7dc858bb5d8a5b5a36844b1acae46400d87007a5e7df05129fcbcdda0eccf14481bc4cf346c7a4a816beeaa0dfcbe84b3d19b22ca8e275afe98b752'
               'dc1473c5b066e6eb131d743a06adcc719a0c4bfa49519edfa5a9847beda85d134762713d3c13991ca73c06bd235edc071d369b098cf2098fc3272b13a4ddd902')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
