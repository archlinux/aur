# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240319
_srchash="f15afa84be7bda050bfb93e321bbce28b56d10b6"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/f15afa84be7bda050bfb93e321bbce28b56d10b6/LICENSE-MIT"
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
	'84a26011854264e6c12b6e81a10293227a3d2507e64bfded70cdec81e6c1b3d0'
	'c306f87ae9ddeb4798e763a2e1961d1c2b6213cdcaa1e0cfa338ce8a08fad693'
	'1016e5293da4943164a7097481c21b2b45539abb543b211465be96e8c3a2a8c0'
	'd68af8d5f12d5ffc0801f4155c62d4b2666ed9c8f3511c35548b3b0c8f972ed6'
	'e8cd691bd0fdef9ba84cf9b74ae87624270b47254ce29d0224b888ee9fe295f1'
	'3e7fe6d29e9509c8d9ea78567bb40b8c556c8dd16942ca045be2d18ab2c680e3'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'cc6d4ea25891181ebf961ea0c42f422874ca80555ed94dbfc4a5aca904cf324d'
	'afe170606ecfa4f90a6742324ce93b2badd51fbcf6a09f3fe094471d0f003324'
	'28f5c27eebe0d2ab144fa1d243e03e5d8f9b59999f7b338354716199b1d4e19c'
	'dbd9805f0d4a976bea81a69f59076fc699b76a01bcbb3d55e30ab13887d89abf'
	'c97b601711c80349c3e1505218d6cedb6d99deeda3ecfcd90ed50b973fcce173'
	'd4dde5acc9ab9c68b1fb32215c4814e8842ef402fdb7ba8e21dfd038eb521658'
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
