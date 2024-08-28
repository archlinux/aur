# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('85d2ff8db15082ec589494cb94a262014a6c038d072720a584b075178cc2932fa6cdad93408fabab59f211127f4db65c96ecfc5bef5ce81d043b01f0f7cf194b'
        '889a46c0afcf4d5370e65ac4d0b2ac134f935e6df21cd770e31ca085257465b1d20575e96045e6443a7086ae39e383215446d002d8803b21edac46b234220f51')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
