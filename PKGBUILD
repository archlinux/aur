# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.43
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('f69a79d32a301f7415e24074e70d8546e9aa8f5cb6ede660b90c31aa82dfff4f13f458a4350b39075578609843ecc6755e312fb9e45ef05f29789d075919a5f1'
               'e51c2782a3cbb3c79a8bd3ba353fe107a483a077ef165f477de93fbab8c519a644ee740c1a584d7ca4a26c3752daeee58e783d3b4efe9a6cdcd2abe5624d44c4')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
