# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240119
_srchash="5dbd9bb2a32dca6aafbd2b4a50dd73d237ca025d"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/5dbd9bb2a32dca6aafbd2b4a50dd73d237ca025d/LICENSE-MIT"
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
	'dda39d3b3c8c88d2047816739c6e15024094cf2a4272d376c24252a679c4a197'
	'69a607a7312295b6e3c01011833fdbde52f23266371d6a78674609396d9adf52'
	'385a0d1c7ceffe55ab84feab97cef658d00618b49304b81d10bfd68d15a16b43'
	'c8ca306640bb36b61e35efb6ac0d483469031c8692acddaf0ad1e597db822176'
	'159db605e2631d1e237085c2ab62938b562f11c4228f1c3da71894269f6da32b'
	'928fa716a4df351e695c7c589421c70cf32d68c4708ad0ebba30b822097b2d3c'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'9cbfb9918d84267d5535e712889b7d63d7971d5f0c8cced352e1ec56e9734998'
	'0fb8f2cc088c675c1b3b4500d42223dec9a424af26832effeceba82c8f686451'
	'df07911acf940eb63cf3480b492a7cc051b2ee9ae5af4e23b5fb9b7c9a513fc7'
	'4540fd9253b81daacf9bafe46ff0d6837e38f3c001018596d776f2468fdad914'
	'2e6088f53f7227c6463c67e668a78cbdec5b779c1196fecb982a732b9254007f'
	'671869fc6088491f8eb59b8931eabf68d016162340d1e7cc4c0986e3c8b5f77d'
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
