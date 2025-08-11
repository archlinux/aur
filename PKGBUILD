# Maintainer: tee < teeaur at duck dot com >
pkgname=sql-studio-bin
pkgver=0.1.44
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse]"
arch=(x86_64)
url="https://sql-studio.onrender.com"
license=('MIT')
provides=('sql-studio')
conflicts=('sql-studio')
source_x86_64=("$pkgname-$pkgver.tar.xz::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz"
		"$pkgname-$pkgver.tar.xz.sha256::https://github.com/frectonz/sql-studio/releases/download/$pkgver/sql-studio-$CARCH-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('7cb4b49fda6c2e70c90faff383c310d920b763bf6c6afd6d65fddd053f0d83fe3bc7e472f799d29d8b94950fb30203ba17ac9c24b8958a3036b35d301143a38d'
               'e1b858508def0428d7b8c08ebcb8816a26e2585d1e989dd3a7a61c7bb2546844b62a067ca0a9d073a19dbc320a2f03cb83272642ed3dab53a1b01142ba7b1c70')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sql-studio -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
