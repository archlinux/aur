# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240311
_srchash="570a7eb141b6ba001713c46345d79b6fead1ca15"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/570a7eb141b6ba001713c46345d79b6fead1ca15/LICENSE-MIT"
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
	'b37604da9b28efc455cc45d42741b75bc83d2247675c5d4df171b233bd698f58'
	'175049aff468009f6cb476660819e23e9eb30e1bde2de143ca129835c58155ac'
	'43aa8f8a1cb5bc4513135d10fab3396baa7d7b59aba5b0e23d190d9eeaf94fc2'
	'b4e85578899911a75acf49fc0abbe59604d87c664db6841207a3d5b1ec9ef853'
	'6e3b2cafd06292f3bf5b3b5cc95d3244efa8eb152efb230c34c7e5f7e8164164'
	'5ee93854d6ee01f30cf530b7f87f30e0ddd78f56083409fa88c2458f436fc4aa'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'11df09203b34df77c8fa3ed09d44950443c0701e47f9925c6072b3514a5b63fb'
	'81338f0cf9e7ae0b791a4daafd9baf67512493820c9b7efe38a6ca8b1d0969d8'
	'b27bc5760156826d558ed608e9f1bcaf718a9ac78dad0db9defeb41d8a1c18ee'
	'3cdebd82d58143810889dfdbec05dc244a3f8d4c45bda8e7da5f4744d1c4c1cd'
	'458648de8d947fd7865331179f37086750541f44989be87bc116854ae96ae34c'
	'a6bacc3f6a88c9d4354119838f9b361aaeb972ba011d88e7b969cce8fda57103'
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
