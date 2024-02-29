# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240229
_srchash="a48081f2717f069d456ec09f31d9e639b232dbed"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/a48081f2717f069d456ec09f31d9e639b232dbed/LICENSE-MIT"
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
	'420b0c4df7bc02a63163eef68440aefcf92fb5b59cd45810f5955826b2cb1fce'
	'f6c78b7b9019abe8684b28dc4503bc91bd181f9a6013c27985e550ec3b107c95'
	'b07e75aa2bc7257e08f45c2211b6383d0bcecc8c9ef40c7702553811f2131726'
	'5b69e0559ca54c8b299a99117483e6b6db4b6d466163d93071bd613a3f2127f3'
	'889197b25fe1bce7f3d6c2976c690611d4fc88c73cb0787cf3051609145704d4'
	'1849ca6da7763331a11a4f515983ecfed76cf1342fbdb9c1c783ce8ada0e1ff9'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'da15bb862a080c46bc927da29e57b02e29799c83f1c31402e76a669610af58b3'
	'd7d1e4a0d4973c34046916ae3358f5a178e6697a5452864bc25865134bdf8fcb'
	'b56e433a298d0da43b51b7432908f7d04c3f9cdf3ba558bd2d18c98b2ac4df15'
	'45fb18caf7deca8c8056081d2db57dcaaa18331a4a8cf050a03785f00810b51b'
	'6979beed5d743a398f7d7cf65489a888f57d956b0e9fc7bf1f06376ed37873b6'
	'f4e7f6ac084f8c25c8c5b511789c4862a5db7785d05ffc8e7284147c2800f928'
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
