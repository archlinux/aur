# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.5
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('df5f520c153a2b1057d537c8b9f2c66d631836f2a998dda9678df9e0a1b5c3ca04f436fefc1726c1de84ae8aedb141272fac28eaa3702f2bce5e6f75fdb0e529'
        'd07f4c8476b228413e60e27f36f5a6a54ecca216a424fc00488c935e7856a8ea63d57f27073dce33f98339149880638a7ce3afba299f7ab9ea9dd1c592189c1b')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
