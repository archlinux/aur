# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.32
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('45d8b23721248a5d8fb19e630887d8a7e4f06d6615ffb47c4584e18e8e46dd9d8b289e5bc4c88a0c53723c46ac88ce316604b8fa42ca19bc3630cade6c58d696'
        '61f51accc781188a30cd8b8a8fe8f86a9fe470522d0d7b6714693226cb59eba03890440a7d1ae8c256d7bb88e62924dbcbf65c577c922af3eebe7ae8a24b8af0')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
