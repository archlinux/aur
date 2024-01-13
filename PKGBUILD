# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240105
_srchash="6bc7d297a5e7e3feecec3f61327a9adbdf532f61"
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
	'901c3d72b14ca574e9131d6f7e565bab49d6331e3a1ef12fc1adea61dc1b09c0'
	'01b821925fa0ba60afd6601f3637bc1ea33e2ab616146f5a2e089648edc5fe8a'
	'SKIP'
)
sha256sums_aarch64=(
	'0645029520b2a5d6b1a5814e5bb9885e285a93d94c9cc767437dc18ca7a19545'
	'21613346f20d054cced5ce34c907471a5c5455f7f25db9110dcd46280678c6b0'
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
