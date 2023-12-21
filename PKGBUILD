# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231219
_srchash="59f506dbb5591d3fe68e638038495730c455d72a"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-radicle-node::$_srcurl/radicle-node
	$_prefix-radicle-node.1::$_srcurl/radicle-node.1
	radicle-node.service
)
source_aarch64=(
	$_srcurl/radicle-node
	$_srcurl/radicle-node.1
	radicle-node.service
)
sha256sums_x86_64=(
	'319a977a12c3b6c37d336f8840261e871f226884508e979106ccd5f67495516c'
	'98af02adfab933fc3c6a2ec531b638efeefa17708f22eb894753089f755e0803'
	'SKIP'
)
sha256sums_aarch64=(
	'80f9ef9e532e442433708e4199b027880fa39f7cad269385da1f120ee7b7bdd6'
	'3cb1b375f73f0f67ba23be7636e7f44b63f625d807982542b8772193f311e2bd'
	'SKIP'
)
install=".INSTALL"
provides=('radicle-node')
conflicts=('radicle-node')

package() {
	install -Dm755 "$srcdir/$_prefix-radicle-node" "$pkgdir/usr/bin/radicle-node"
	install -Dm644 "$srcdir/radicle-node.service" "$pkgdir/usr/lib/systemd/user/radicle-node.service"
	install -Dm644 "$srcdir/$_prefix-radicle-node.1" "$pkgdir/usr/share/man/man1/radicle-node.1"
}
