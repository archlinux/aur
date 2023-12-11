# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231206
_srchash="6ca7da276839e5217b340dbfff8cd9095d8464c5"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache-2.0')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
source_x86_64=(
	$_srcurl/radicle-httpd
	$_srcurl/radicle-httpd.1
	radicle-httpd.service
)
source_aarch64=(
	$_srcurl/radicle-httpd
	$_srcurl/radicle-httpd.1
	radicle-httpd.service
)
sha256sums_x86_64=(
	'7908fd079854797ba6f26f023c13541f57ce7716439a44158bc7359984d5f70d'
	'9eff5f4507c754502df80f8c2609f3b1617d6c9a559304930bd6133de52b034b'
	'SKIP'
)
sha256sums_aarch64=(
	'ab6f0403f00256706ca41bfa527ce0572cb1fe24d29b714971323d9691fdbbb7'
	'a298e2c91e9ebab33be744bc1fc667371af4c89fb108a5962967c06f0a9c34be'
	'SKIP'
)
install=".INSTALL"
provides=('radicle-httpd')
conflicts=('radicle-httpd')

package() {
	install -Dm755 "$srcdir/radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
	install -Dm644 "$srcdir/radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 "$srcdir/radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
}
