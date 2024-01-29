# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240129
_srchash="e58419a9b0cc21a7353c7a94756bb6bf42326ba4"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/e58419a9b0cc21a7353c7a94756bb6bf42326ba4/LICENSE-MIT"
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
	'b3a5de320afd2a596f2331d356680f21881915a7a813f10101f67455b9606e6d'
	'66419512577cdc80562669e18f2fb2b1cbbbfd1596417d0f0a55aff8a7127d00'
	'610362188a22a1a0825ea43430fcf6e3c1556058e806ba07fc0c54adbfca7894'
	'17f868168ac2b369efc3ad17f15a1ca32ff61e5b8db6e68308a27026eb436a8b'
	'2af9a3fd30316318ad2462e02889117c47ff13fca927a60366a681a699aa5ed5'
	'69fd64b7f92f239819151ca0cf887a6f66d6c2e506b89489cbca05328244035c'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'ebbcf52f5fe1f6115f95980afc87e8acf98917b562242e6b90aebd9be80c6b47'
	'56c7f6b10ff66383dca9d91725abf5bd1362cf30cfd44d712e3dbe6b596c7f10'
	'e5ee6d373741455be37c9238b5a5b065c3524f41da59dd9cbd94d64cd85cc5c6'
	'df82f7f6a20ba697b3b13c36dba7f28973eb71d993016fbb8c825205d6b7505c'
	'b4c348f2515f9559a56277c182be6a510aece5dba0788d7004cba9e34195e0ac'
	'f2e83da093ecba0ca42b7694c0103f958333eb1246717f132459ba71b3691ee2'
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
