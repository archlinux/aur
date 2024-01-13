# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240105
_srchash="6bc7d297a5e7e3feecec3f61327a9adbdf532f61"
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
	'36b0af962579ad8ad523aaae5b1506f8fecdb00d2033fcc0359fcfb3b3475e26'
	'0cbfcbfcc7515bea08d63f74a0cf2ab8369ff69cc5f9422458717de3e2d7b4e3'
	'SKIP'
)
sha256sums_aarch64=(
	'e11fd7155a30b2c3cd32e40787d6ec009f1358cd0b7391b4d445e380b6616dc7'
	'aaf3c81edb058338172ed6f13d0fb6dac7b8102012f9c9e62e20208064b4791b'
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
