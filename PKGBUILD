# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240118
_srchash="ebdaf0edd9734cab5015aa70a0496429d6a5affd"
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
	'dd20b4171210ae2c16b010a7ddba88a39f191db54b73924d9359dd6b5d21b46c'
	'af06237324a877e1ea3773cb90c62206d30ca7c3e5f8391ab6c620a7affc7b0d'
	'SKIP'
)
sha256sums_aarch64=(
	'840dc1d62f45adf8c608cf6deab26e1128055855fa501ebadd5aac689e959082'
	'c03a5af5d3aaeaf9cad9590208087c95cfbbe1b74d67c456e91860d0cfa4308c'
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
