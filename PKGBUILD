# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.31
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
_git="https://github.com/tursodatabase/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::$_git/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::$_git/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('d653d1659acf589fa7bdb25e84f5598d8df8d60a35855a3febdbae645a647542dde467122557ab5b4d9d63a4f6d3dfe9cb4776e68cf1101c153431b87f4955d1'
        '300ee2f2728e6ccd62edb96ac389fb38abbfd1e485ac2875e5885e7e5f91f2ccda2c66225fcaa8942a52f408523e0949ed053a6a1394fef31b1585d7598f97b6')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
