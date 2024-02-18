# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.22.22
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('ed2bdcd26c33b115b4633c9032a047ed7327d38def884addf15ffd9c107063eb7168e724430b13903e3455b0ac1969a2120be4df9a3a036f7c8d4155f3eac032'
        '31dad2112e543377f8495623f3a805511bda0ffd0bc574894ff6a8947a9d97e62edee054252d66d63ad83a28a81d3b5e4471529c8b8c01356bb5829e688298ee')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
