# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240223
_srchash="09f2befa58dc6057e052904b6947bdd17d3b0553"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/09f2befa58dc6057e052904b6947bdd17d3b0553/LICENSE-MIT"
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
	'f93032dbc4fb56c69f0315772d3e035337dcdf339fbdc212a8a9e710d63bc3dd'
	'e74f75103575689d0445162829fad26e33f66a5bd084c2f9705ae4370eec2295'
	'76b57abe9762b483c8e1ec4feeba8415bcb0e664c05b8d8b90bbc340c5ab7389'
	'6318df52d3bbb5066b323917ee87ab099c3a35c26e24d9aef2192868c3505190'
	'bec362c5c72e4dbb047a2632e1693572ed7ee2175032f343ac7b53efce22f7c0'
	'9393a942f921f2bf42f92b857ae639533b1f7ed460142cda82701f40214fdd1b'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'2de8818dbcc0fd9d859e18f4798c233777a23444dea95518e00accd34d0e2501'
	'48a015fcc23c39561280863b9a8aecba296cf7def574c537b40c5dedb2e036f8'
	'2f6fdc622b5a5abed506a395bed3e4bbe6a175f80041a1929a016b6a3af3b4d4'
	'ef80c88214c0a1c3c2513b59f865ae2767048409ff2b384c58356183a0e91c14'
	'c8256c35f51bbcf364ebd7359298fd57d20dce0c85b554fb2cf1e8299232c018'
	'8760585fa544290c29464e8e4fa56f459bb67b218bb8010f676a0fd6c58f63a6'
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
