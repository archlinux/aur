# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240326
_srchash="081af03362b5bd3d637ee22011a4e5b51a1f1498"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
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
	'f84c33e5fc2dbaa38a1eec2b986c1b4e22c04a4ba411f4c2955d621d017d691b'
	'f7d3a7d3c0de8da37614c0a5e2f92ed461e919199cf7fa73d47f8ef78dce7317'
	'd1743965c46112f3c9861d68a3628ab2f27fd7155ab539ee78f20ef4a7646596'
	'2d9586df9f6e6f538d9061bc69be43a378f56abf81b286e473a81d7acde962b9'
	'4e4f286e979c74edd40c2aa3ae0f4c2f7f49732d3c57add731f641b259ce4a92'
	'054e95570430e0df31db37f38c5273c9ab29fd29cc5a9463fb972e6939035a54'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'bd066dc10e93db83a40e4b1c868b6b4cf0a1c7b2dfd24c3e98411965d28b1bde'
	'b70cd0f210daaa66fdde4aa34b3e20e324960aaebc54861d6f01b4461453f6a5'
	'c4038021b543100614e86c81d65b8aee63b18d4a559942f648a134682d9b368d'
	'824cd95de4d42571b8949925139dd96acd478791f3b3e30e92fa439e854ee210'
	'7cd5ca7f16eac66768d7176af4798d48f012be9312b0d5d197c1ee1b4f72248d'
	'18987ede79acc8cf5a8c6262b504f1092ceb91c55ce12f5e06928e413bf595ec'
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
