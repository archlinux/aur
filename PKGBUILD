# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.4
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('2fb11b6a0ec438ce40371ebd3de0a949ff87a633d68aeeccda67830a0d6e59dee282115982318addf17cbb894e08290e1438cde9fb3e89030e63718ace257de3'
        '9984e43c7fe97c776462aa37292cfe786a30b0084c5f91a54a3907a67718bb38c3d184e6060fcd2b34edf39a226cd7f802470ed10baf4c99d3854000a83d908b')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
