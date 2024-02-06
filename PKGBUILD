# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240205
_srchash="8928c5ee2628e0b4d738289b5030fc3e2a918e5e"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/8928c5ee2628e0b4d738289b5030fc3e2a918e5e/LICENSE-MIT"
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
	'd09e834b69001da5fd9b9c3719547372214a5c7fc474e8e781e6419ff5fcbb4f'
	'8779228a27d72ab691c9582ca7b5e7be8157fa6707bc35522f21004460df1008'
	'adfc2b22a2516ef76971fb7a6ab22b65818e7c06f65e4f48f94e8d808cc1bb49'
	'8bba8384d3e9200731e95b47d633204bbdea0e09de3d220033dddb7c72e36f85'
	'df05d3c637e67f601fcdb8a0e1f0236ac8e96bd649df44bf2b1045f9909c2d23'
	'6cb194c2da73f63841fdb24d9b2f4a6036e67eb61c6b4c24665560a6165771bc'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'67427acd7ec3c5a404598a2a4bdb1e84e32864b678149dc1face98067f8ddae2'
	'95a194834c251bd48b510559f21258a63c09ba378a1ef66bd57074df57504b9d'
	'4f5066d8b5a99c5b682a4c90841fb2d0e595b2f8fd324626a5dd67c4483eb3b8'
	'8a58e6cb60757f93d673fd739b749e433a8e08dfc81b9e7005be1fb2e8744590'
	'e4eb90bb6d9fcdfefefef69711031d91aacc19cc982fb6bdbcc12e6e09cdff30'
	'6a66739f2706ef5b7f754cced4858164162112a8b44c5bd152e74b927bcf7a32'
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
