# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.28
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('8eb0f9ced7b2b542dffeb75e76ff6ffcd16840d3825038488b1308fe1cada6ca2fb4f2f3eb91b0072006977531154b160f5d8f3eba3bf123631bffb275a29b39'
        'd9033cf2b029effa43d83ff962a3fbf98565f09df26010e4928d1d19aca44f77aace416fe91ab0c53fb02143fe77888a6b17c8d85ca3db07da492d624f276cef')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
