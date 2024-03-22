# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240321
_srchash="0581c017ae1fa7cd3d553c855c439d40e12357e9"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/0581c017ae1fa7cd3d553c855c439d40e12357e9/LICENSE-MIT"
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
	'1490583e5bc086cb25d19902d78f94b4443d76989eb57e5ea22d5e131af4dffd'
	'0e748931de975cc67f765320ce159b3ccc476de91c98869dca124811d1644e74'
	'29f3c7e17f758befb570ffdc6ee907a001037b7ede83dd262c2737a552388c31'
	'ce1e19b8b0f9a353f4e55da5d43a10d1f5f68b85ac905dc60cda6004296ae43c'
	'd2c1bea80cb9dc610b25710e55780196e85b803f09685bcc7f5daf761b0a1ffa'
	'5cc36bb2d76ccc0a659ab86fe6ca6370950fc39aa15a93c13efeb4e54775af58'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'bde40d5d08c3180fc6154283c1c7799515a1ea3966403d115a65fda9492ace9f'
	'8ea1f860f4da1e6c11f19d945dcd139c403a500c4557f3ce44c103634562bf00'
	'fa9f1eb359866a59e2be11d651ae7b7007f7e66546ba88cb3455a9c229c1b6e4'
	'18cf08582b7eb308a6b327b3c63dee71bea23607f55cd684625dc0ed6fd66d9b'
	'e5de45667749d3320b1ff2b908e956ad6e300439c8b4e9e584acb6838f37b3ea'
	'ce87657a5765881882f3875460894139cec9a835eec0cb4d3c65b36176ec72d2'
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
