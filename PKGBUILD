# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.27
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('255cf00a370a4b32702c1a84d61df44e41e6b829ddd6309fd6d9091867d0eb0717dd0ec93d6965ae9306d1d7232fa2a1a08f3e3fd450c0be6baa67cb40b70165'
        '5f0d27946f1680aa646e068e5309500bbc14e2974131011907594457a0a944c1a037b15ea91d07307f95e12f225911c4e8b7449c5e3d7400c6f7a120e996e244')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
