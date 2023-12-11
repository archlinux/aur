# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231206
_srchash="6ca7da276839e5217b340dbfff8cd9095d8464c5"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache-2.0')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
source_x86_64=(
	$_srcurl/radicle-node
	$_srcurl/radicle-node.1
	radicle-node.service
)
source_aarch64=(
	$_srcurl/radicle-node
	$_srcurl/radicle-node.1
	radicle-node.service
)
sha256sums_x86_64=(
	'2beee5bbf97f8f72cf9ee0b292d1891d3c09bd56cb25fdcfe468b42169a4efcc'
	'2e8a82c6555928cb440ec19a3746cd8ed278eb042e837307c62ac686652a3064'
	'SKIP'
)
sha256sums_aarch64=(
	'7ba1a92c61d3b800d4ce9679adfad9125e793be39bd166ece62508670aa394cd'
	'8db6597354877b9962323c4f97124cbce9efd5e2388421cca3d251cbda4a3032'
	'SKIP'
)
install=".INSTALL"
provides=('radicle-node')
conflicts=('radicle-node')

package() {
	install -Dm755 "$srcdir/radicle-node" "$pkgdir/usr/bin/radicle-node"
	install -Dm644 "$srcdir/radicle-node.service" "$pkgdir/usr/lib/systemd/user/radicle-node.service"
	install -Dm644 "$srcdir/radicle-node.1" "$pkgdir/usr/share/man/man1/radicle-node.1"
}
