# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.32
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
_git="https://github.com/tursodatabase/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::$_git/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::$_git/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('949953fc01722878ace8a95ac1984c3b78f255c282ca7f9018f8f2f1fa0c4ce9e63ca71ecb04940245b3fdb8e2d34fa6ae189df476371547e208bdde9ff06193'
        '7eae80373e7758ce205e3cd3e82ce5fb03b1a26f42ea630135c99fc3643b0f401d7451964dd53c2e4489984cb91b9c0f5cf235d2b5decaba165f0c24515c3141')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
