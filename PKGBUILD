# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240131
_srchash="15d17098315469bb180157d1c20344faa10f4f73"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/15d17098315469bb180157d1c20344faa10f4f73/LICENSE-MIT"
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
	'9dd21a3cf837d1975e09ed2d7387eb6d23453497ddd32e9364c8872dfc6b0369'
	'2cf273fef707627fd99cf9567c793b444d9022941ce63055d8cd8d96a620bc2f'
	'a2335a3aa2d655e47ae4e52a076e6e2e707ce9c2c50025b8e55135a19ad0b009'
	'4fc48ca47fa734c829a2a4fafcf15ef0949d36a94b79b235f0580816ddff5631'
	'1edf613fef9e652c63ab296f4296557d966f4ec82655a187cd77485f5b17904f'
	'49b20960a20a818f5978f672c05e6b76c62f5f4df1e6517a7183742334c1c7e8'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'eeb43a9f9f2e740e378adc7e11e14ac9b09705f1de4d60667a193e69a90f4c90'
	'f5080b428157a597f1dbcbb1759deb5d307bbaf8332a0e6b49cddfb66baad2bf'
	'dbf4a52082aabcaf2710d99d164cb1555d4f636b16caa3a331814e6ce3002154'
	'a9d09139561d9ad38cecf14dae0d3a1a28c9e0f310e21eaec336d64d8a6a0991'
	'afff4c5c634d82c949db664877104bb54e875eb629959479b0e09d674c7ce8b6'
	'965ab4cec4f02096157f6da344ce3bb4f3ffdeb400e443416f7c2c27c0297f34'
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
