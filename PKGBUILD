# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.24.25
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('586351eeae671311130057086aec56a1e104a5c1ecb7523e4c4b6bbfa9eb47f9937fa88fda6c891b4c9869dca2a86b4efba719647a275a02abb694e479a62eae'
        '681a7bb92ed4f6f64395a044fa6689fa697438a4cd2dd1037111f526b5f650ae66e8f0b717c50a8bf42e82b426f6e1599cf458c120f20f30a893400878af66aa')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
