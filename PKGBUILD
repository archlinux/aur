# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231219
_srchash="59f506dbb5591d3fe68e638038495730c455d72a"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-radicle-httpd::$_srcurl/radicle-httpd
	$_prefix-radicle-httpd.1::$_srcurl/radicle-httpd.1
	radicle-httpd.service
)
source_aarch64=(
	$_prefix-radicle-httpd::$_srcurl/radicle-httpd
	$_prefix-radicle-httpd.1::$_srcurl/radicle-httpd.1
	radicle-httpd.service
)
sha256sums_x86_64=(
	'2424ce1a3fcc8db8a557ea573594a07c4a40cfdd14aa53052e207422b660b95d'
	'491965550b6c102cdc7a5857ab639eaec5d7976bb756a485704946c626fe7dd1'
	'SKIP'
)
sha256sums_aarch64=(
	'f6d9af629118a626c5cffc50a23b28e477304d12a7ef4e0d2eb8bdbd1289d413'
	'07ffc1d6f861ebafde3eaab9666274c7a81c1c6eb4d42aaf7c0abb49411cdb50'
	'SKIP'
)
install=".INSTALL"
provides=('radicle-httpd')
conflicts=('radicle-httpd')

package() {
	install -Dm755 "$srcdir/$_prefix-radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
	install -Dm644 "$srcdir/radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 "$srcdir/$_prefix-radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
}
