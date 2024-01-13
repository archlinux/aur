# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240105
_srchash="6bc7d297a5e7e3feecec3f61327a9adbdf532f61"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-rad::$_srcurl/rad
	$_prefix-rad-web::$_srcurl/rad-web
	$_prefix-git-remote-rad::$_srcurl/git-remote-rad
	$_prefix-rad.1::$_srcurl/rad.1
	$_prefix-rad-patch.1::$_srcurl/rad-patch.1
	$_prefix-git-remote-rad.1::$_srcurl/git-remote-rad.1
)
_srcurl4=(
	$_prefix-rad::$_srcurl/rad
	$_prefix-rad-web::$_srcurl/rad-web
	$_prefix-git-remote-rad::$_srcurl/git-remote-rad
	$_prefix-rad.1::$_srcurl/rad.1
	$_prefix-rad-patch.1::$_srcurl/rad-patch.1
	$_prefix-git-remote-rad.1::$_srcurl/git-remote-rad.1
)
sha256sums_x86_64=(
	'eec1ad7a218d71cb5bd70dde1692a5bb7e945c762171195c3531288cf0987c63'
	'31eb21f327d9bf6fc5d54b479d5e59868f96b04e0dd80cc29f56cf69c0207d61'
	'6ed9cd30fc2ea1c47b39e9097fdeb8d2cd62d4330634ed8a118b999f683aac80'
	'11b0d01ae0cb35f27b87d2e5385e23d6bfe0c7b88596cebdb8bd7d5639e65ce8'
	'93541de9f7e291a2397ad92676153958cd00a661f60116b7d087ae95ff07783b'
	'15b804dfdeb00009f3d5903bd1deea77540890515b52fc60e117a28d8b657cad'
)
sha256sums_aarch64=(
	'cda7464802ca2213c0c974ddd1c4151b838cea27b5479a5e2f78fe37e26e20f1'
	'23bf17569a62ad7f8d9029012cd98814a061398c64718240341749718f576d83'
	'd19401daae9202fe287fe38d2b9b153ab708bbbd664e6498f5f3351d32335138'
	'044d97a197553fde83c8fdf7dbc4ac79c4df9ddea92b2dc7228810763e64d1a9'
	'a7b4ff07a45bc40192ccee20eebe9a147399dd768c42e94fe07014fb2867eb5e'
	'4c5e8e1f47f0751bdf3c59c424ab1ac998d5d24d220814aa40cebcb0b65c240d'
)
install=".INSTALL"
provides=('radicle-cli')
conflicts=('radicle-cli')
license=('MIT' 'Apache')

package() {
	install -Dm755 "$srcdir/$_prefix-rad" "$pkgdir/usr/bin/rad"
	install -Dm755 "$srcdir/$_prefix-rad-web" "$pkgdir/usr/bin/rad-web"
	install -Dm755 "$srcdir/$_prefix-git-remote-rad" "$pkgdir/usr/bin/git-remote-rad"

	install -Dm644 "$srcdir/$_prefix-rad.1" "$pkgdir/usr/share/man/man1/rad.1"
	install -Dm644 "$srcdir/$_prefix-rad-patch.1" "$pkgdir/usr/share/man/man1/rad-patch.1"
	install -Dm644 "$srcdir/$_prefix-git-remote-rad.1" "$pkgdir/usr/share/man/man1/git-remote-add.1"
}
