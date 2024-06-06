# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.14
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('56e77a7e7cf65efbf20a82a16c79aaa1e3b55ce2b1ede15a0a26f064ffebb22485f4b7c85d4dc644de37aac5ba9ac5839163a6938fcb0120ed3582d1af3210de'
        '2de5cf46d9a52adfac79f40a36c3698a219f108dbe2acd7b5abab1db192bd3cfb89cbfb26ea8f6964830cbbcf8cbbc290ba612c9da1e234d780b102cadcc1e91')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
