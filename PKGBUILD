# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgbase=radicle-cli-bin
pkgname=radicle-cli-bin-old
# there are no versions attached to the binaries, just upload dates.
pkgver=20240407
_srchash="bd8e0ebcda8f6f06dc20641a71614e3778a43fea"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/bd8e0ebcda8f6f06dc20641a71614e3778a43fea/LICENSE-MIT"
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
	'08e1be99591f84d36099f73bdbe26b9c1aa8c6965e1346f2fe9964b268c1a202'
	'c2c6872279b4f1593952f8ac6a00c2ddb0a77abd697b6f460a1a43d880cfd1f5'
	'0ecaeeafee859bb150e05288caf008ee2b746fabddb386c220fd7bae6098ae9e'
	'b989b006ba0f8e07141c5940997a637b1cea7750a5d281c20ec62265344040c6'
	'cbd303069b8c592bd3ae21b92ff97d0bc7c1125a2f703517788d82d973bb19ba'
	'4072515af286d0bfd45507eb3cb6e5eb5528b2a97474017c7fa0bdba64d23492'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'33e77f874b0665e4a800d31c1a007b339d20dc49e291a28e7395ff9b1cdc02c8'
	'b91c050633f4ce1643ccb7c26a0b29ef58dc599433d6563cec455bc4c7376da2'
	'dc795f8905ee43ac9c553435671ba292b6be8cc403a867cd724fb968fb9f60b2'
	'f8bc58fcc4bb2b285a272f66a7b47abb3872046eefb1ca9a56f4097621e55b69'
	'ab95f8135e2a9fd0a242abce62dd880204f287cd46b2246e02e5adb8e45ec24d'
	'4746e0316cf7877e5b27407088cfd206c8d8180c0a437913c41f1ecab2cafcf0'
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
