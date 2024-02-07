# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240207
_srchash="fe55de181d4320a0cd7a6ebd2820764280ae9adc"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/fe55de181d4320a0cd7a6ebd2820764280ae9adc/LICENSE-MIT"
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
	'17848c5d1a1efa3068d7b6af9f899b47897f20fb45738b4d6ba59a4f76b41141'
	'0416db28d2794deeec7e98d814e448aaced9dcd7bff35aa7a8550119919c65a0'
	'baf25d99703ae8b450644317e4b5b91d5383753a87624831cd0fb97129d4515d'
	'4d1e754793f22993c4f3ced32371e2ca79168c96fa053d5b5d03fec63c387812'
	'1cff9a066395f4d970c4375ba23e6c66f67a2a52bd8294a2db5d457ab8a28021'
	'adb8c65560eeda99542cd9444c0edf99458981bb2b5a0a5e0cc259e65f67aa42'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'6ea46cbf7dc8a60a2be0478fece7c010f93c41bf25cd67ee4d6b94687b6e372c'
	'195652501442ee9b26aa84723f79d326b7e9eae6718a681eda839d4ca754a8d5'
	'ce03d7f9e95c1a17622e3b79298e4bb3c07868dd0ccd48fc12967815de56cb90'
	'7af924a48183c113a64b30a7ce0d05135f077d7474141e7b0dcc32861aa4472a'
	'0c91299442ca3a830936606c3bc8c98e4ae9c01bcb8f5ef7c1cb1b3745d03817'
	'ebda57c96b426b2a6d6300f8a571b2a61c54b4153a80a684b79d8f3e22716b2e'
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
