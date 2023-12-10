# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231206
_srchash="6ca7da276839e5217b340dbfff8cd9095d8464c5"
pkgrel=1
pkgdesc="cli to radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
source_x86_64=(
	$_srcurl/rad
	$_srcurl/rad-web
	$_srcurl/git-remote-rad
	$_srcurl/rad.1
	$_srcurl/rad-patch.1
	$_srcurl/git-remote-rad.1
)
source_aarch64=(
	$_srcurl/rad
	$_srcurl/rad-web
	$_srcurl/git-remote-rad
	$_srcurl/rad.1
	$_srcurl/rad-patch.1
	$_srcurl/git-remote-rad.1
)
sha256sums_x86_64=(
	'9edcdcfda73f4938ea9c3a489e52cf5bc15e84111ec7722d82139d03dc936a3a'
	'32682b8cf00685d6fe3ae60eb1dc4d39657b367e05944a34be352abfe34c5950'
	'029df6f1498e7a55dfed55f31b1df36f4e69e1a3d13d6caadd4d8bb6be782e06'
	'4a01191bb1ba44ed156eecac0ed7edf701297b4cc39f4c57b9c8dac61a15e663'
	'03f759e56861235783f8280592039a3675a3eeb483590cc49aa4f195778b72c5'
	'15b2cfded18bd0675194e0a2e1e21a9aa38f1077dfea9b9b9bf2236a0aa57671'
)
sha256sums_aarch64=(
	'0c657e51412193cfe56a2a5e26e49d5dfa46a17a952cca0253958444b38ac841'
	'7e3244efc0a7bf45b84178f1765863a7593a2f06bd06e5ecf5125d6b8ebfb758'
	'e18767295e881c66b3c62a18ace8e563ad6b78d7b4c67448bb1dcbfa5ab402e6'
	'4e257dbd2c1616afe8e7160d47666440db51134b73137d561de3905a6d0fbef6'
	'298ca03a8154bded126a975bb3b8e64ae47474b31e47b0ada56736033778d7a4'
	'3154a869086af43729f8ec4982371057ca9d9acd62b4d787a5a43b658125d46f'
)
install=".INSTALL"
provides=('radicle-cli')
conflicts=('radicle-cli')
license=('MIT' 'Apache-2.0')

package() {
	install -Dm755 "$srcdir/rad" "$pkgdir/usr/bin/rad"
	install -Dm755 "$srcdir/rad-web" "$pkgdir/usr/bin/rad-web"
	install -Dm755 "$srcdir/git-remote-rad" "$pkgdir/usr/bin/git-remote-rad"

	install -Dm644 "$srcdir/rad.1" "$pkgdir/usr/share/man/man1/rad.1"
	install -Dm644 "$srcdir/rad-patch.1" "$pkgdir/usr/share/man/man1/rad-patch.1"
	install -Dm644 "$srcdir/git-remote-rad.1" "$pkgdir/usr/share/man/man1/git-remote-add.1"
}
