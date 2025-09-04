# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.45
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('0a3cba3dfb227b1e9542d5d4e0c540e4fbce70874f984fe362ec2e08f76ad6de4821c1a418a1627beb502757f5659d7fff8b4b9d6a9e8fab9d3176c76de2ffca'
               '1f6582173897d15635a5be249a669ae5d00f7d29391b080d29ddb19d12260a4469104977640395e559d89714c8ae5d09cf185342ef1ba6df3ddd961f75f0c78a')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
