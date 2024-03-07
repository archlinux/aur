# Maintainer: tee < teeaur at duck dot com >
pkgname=libsql-server-bin
pkgver=0.23.6
pkgrel=1
pkgdesc="libSQL is a fork of SQLite for modern applications"
arch=(x86_64)
url="https://turso.tech/libsql"
license=('MIT')
provides=('libsql-server')
conflicts=('libsql-server')
source=("libsql-$pkgver.tar.xz::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
		"libsql-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/libsql/releases/download/libsql-server-v$pkgver/libsql-server-x86_64-unknown-linux-gnu.tar.xz.sha256")
b2sums=('cf82abd6d4e786ba54ad9fc88cfc496895f20689db14fd21142b5b3c02f7c79b08b87a6725c5cb61847d62d44125b2bb0582dda62edb758d60222c4faaa61b57'
        'f50da144962b46c824f1145cc7d0acfc392c65ef1b46a564fea3cbf471f99351ffe673d3c4906977e27db64974d5f1f05a2941267ebff771f437353f31965d2e')

package() {
	cd "$srcdir/${pkgname%-*}-$arch-unknown-linux-gnu"
    install -Dm0755 sqld -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
