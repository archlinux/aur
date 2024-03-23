# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240322
_srchash="ada492f6996db72f256775332d4f669b9bc513bb"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/ada492f6996db72f256775332d4f669b9bc513bb/LICENSE-MIT"
_license_sha256sum="fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-rad::$_srcurl/rad
	$_prefix-rad-web::$_srcurl/rad-web
	$_prefix-git-remote-rad::$_srcurl/git-remote-rad
	$_prefix-rad.1::$_srcurl/rad.1
	$_prefix-rad-patch.1::$_srcurl/rad-patch.1
	$_prefix-git-remote-rad.1::$_srcurl/git-remote-rad.1
	$_prefix-LICENSE-MIT::$_license_url
)
source_aarch64=(
	$_prefix-rad::$_srcurl/rad
	$_prefix-rad-web::$_srcurl/rad-web
	$_prefix-git-remote-rad::$_srcurl/git-remote-rad
	$_prefix-rad.1::$_srcurl/rad.1
	$_prefix-rad-patch.1::$_srcurl/rad-patch.1
	$_prefix-git-remote-rad.1::$_srcurl/git-remote-rad.1
	$_prefix-LICENSE-MIT::$_license_url
)
sha256sums_x86_64=(
	'07ae18fc67ed2ac6aaf9b7a1ef7582c6c0ab44f52c87f3c854175db9a7f43f5a'
	'b1b2be0d1552d3af408fedf858f6c6e178d14744d5428dedb7dc135845cf5542'
	'339c0b004384995d4d0d55efcfdd06a97832556e54169509d6230b371bc3d1df'
	'43fc972182d28356b45a7ac273d37aa151e25b0cd970497ef04826d74b9067fe'
	'02b0b0b78d67eefebbafef78f3c1a964511e9e042e3d05271c7c3886afd5a9e2'
	'31faac61cfbaf7212afb8ca2694ee42d0943ab905631cd2c7a065966e8b1da77'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'16bc7d48afece941712a9d46e54669e0dad4fae40705e65c1fe9be3c8657508e'
	'0abaec0b3d382b37bb11def282f123c2a8cd36778001268dc2db4d2173d365a3'
	'e90e0a439ce717678675421b1661a8fb8a5717ad38d7927b1dd0a5027b3104b5'
	'6921a02186a42ede73e42b1aafc90e513239af7f5970ace187533c9ad17a065b'
	'248b5abcf0313f037dcdc7673ebb85d64c070e32ae6d44e0fe8f7537d4728e72'
	'd8f76f1197767fd582caf89cfbb5cf75dca6f98a6ca6cefdaa652bcd255eef62'
	$_license_sha256sum
)
install="radicle-cli-bin.install"
provides=('radicle-cli')
conflicts=('radicle-cli')
license=('Apache-2.0 OR MIT')

package() {
	install -Dm755 "$_prefix-rad" "$pkgdir/usr/bin/rad"
	install -Dm755 "$_prefix-rad-web" "$pkgdir/usr/bin/rad-web"
	install -Dm755 "$_prefix-git-remote-rad" "$pkgdir/usr/bin/git-remote-rad"

	install -Dm644 "$_prefix-rad.1" "$pkgdir/usr/share/man/man1/rad.1"
	install -Dm644 "$_prefix-rad-patch.1" "$pkgdir/usr/share/man/man1/rad-patch.1"
	install -Dm644 "$_prefix-git-remote-rad.1" "$pkgdir/usr/share/man/man1/git-remote-add.1"

	install -Dm644 "$_prefix-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
