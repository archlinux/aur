# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.46
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('4dcc6194ae12d45da1fbf12b9cfbb53e3d502c88c857335a38eeefae1ae48d1874b5b0acbed8a34d052db35c41dadf8a8c1b7b63960749d6f4383236970e2c98'
               'e358eae0bcb214bec16cfca313ea30ac643616497b869c088d475f638fdd39e7e928b2ccbd0d5721cd7b9ce2a6b02336a4e60642038c521f795ad9de5faea212')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
