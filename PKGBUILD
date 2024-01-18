# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240118
_srchash="ebdaf0edd9734cab5015aa70a0496429d6a5affd"
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
	'ae84537a386aa634d3b0de6aec665f1ff60b447629e28cb092070863a92b68c9'
	'af2c810eeb84261c54ac51eeebf5dbff8367d50c5a193be911b8afddcfd6bd65'
	'SKIP'
)
sha256sums_aarch64=(
	'1b67d6217b37d5bf2b80d3562bbcf001306d9f3f8d7c06aeb280fa138cef3db8'
	'5c3c7edaabc5a20d0c9f162716444f303e68c229e7e246989ea5e55b5e38e5b2'
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
