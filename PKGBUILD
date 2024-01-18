# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240118
_srchash="ebdaf0edd9734cab5015aa70a0496429d6a5affd"
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
source_aarch64=(
	$_prefix-rad::$_srcurl/rad
	$_prefix-rad-web::$_srcurl/rad-web
	$_prefix-git-remote-rad::$_srcurl/git-remote-rad
	$_prefix-rad.1::$_srcurl/rad.1
	$_prefix-rad-patch.1::$_srcurl/rad-patch.1
	$_prefix-git-remote-rad.1::$_srcurl/git-remote-rad.1
)
sha256sums_x86_64=(
	'58c1759180142275f298f4843e5eb945edb55bb7dd39dde95dc218cddb10612c'
	'54f5992381dfd04f27931f526a6c5587913227d8fa9d0e019954a6b25c24785c'
	'fd0b3970f96e27671fdc81d1669d1f0d0ff8b48e8cfb89c106e09081cd375055'
	'6afaf456a21265bc988ef180420f4112750e2e040e331e88870bb8a9f7a25c86'
	'3191d42a024845e2309910d8539045ff520dab9c412a85e9896a549ba48cace1'
	'4996992b239bfa989bf8506bf9d152307fee5ba9d5b58c0f2008bbeb8c2883d9'
)
sha256sums_aarch64=(
	'af87b905f300283f4fd5c5262ba25cc5871a9d373ed9417e9f34ab771243efb5'
	'3ffbea52d0aa4238458ffd3d836ece1ef861b5f256f25d7b62bde9caaf922412'
	'bac78b1ff498a112ddcdbd66812a7b1986aa24a70966aaca23b6173e22e6cebf'
	'6701ef8a32e745523d50a0862fada44e0df93de899b4c0a83087dc8789278a0d'
	'6bbef3bd834ad370da0157023ff7fb0801121f75e84f61f89399808f5abb57d7'
	'a1ad55e801d4ce4fcb350ce6a824a0e6cbcc38cbbac191cfd2d00abd748f2cb4'
)
install="radicle-cli-bin.install"
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
