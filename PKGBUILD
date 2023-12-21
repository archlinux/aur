# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20231219
_srchash="59f506dbb5591d3fe68e638038495730c455d72a"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
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
	'c8096f4c136b12cd761540ce7270b0f4787662abb185394a557da4abbc1633c5'
	'c38d6dded7755eb5d9e398e4d381f11fd850cce4fc1f16a9b41a609e7e3819bc'
	'70fee7110aaa26635c669321e300745efaff9bbc0a839f426934a37e5dbbc023'
	'ae0e25d1c07f3c3998df4521f2807c36e60c803bc24ce8d060bbc5f03c8333d5'
	'f3dfbc932110bf9278be864a11c4d1b60d61001042bab3f086e358739ee4bf15'
	'fd3ba466d48485a89208e3cf302f63e2df900c52d4baf4311dea56029ee7938b'
)
sha256sums_aarch64=(
	'c4ad9d8befabbef585e7b920f51185dfb8cbbcbab66ba21cdfc51f5675f32fde'
	'ff651feff412c917cde7cb6c0d04492cb0360600dafbe715930e3364d0d75377'
	'7ac33cd712fdbf7cabb21ac388d6144ec83394666590a8ba08b9833c867eb30c'
	'12a644eb680d9eda9aac441d8bad84fbeaa71aa85f4bdded0ce59cae22b9a242'
	'5928109977d86b456eb8bd4305190589654000f23bd6d2d3257ad424ca8ef84a'
	'2ed9715c5c9e9ee257ff1d8e090038022ba671234a90889cda9bd8aac87c9309'
)
install=".INSTALL"
provides=('radicle-cli')
conflicts=('radicle-cli')
license=('MIT' 'Apache')

package() {
	install -Dm755 "$srcdir/rad" "$pkgdir/usr/bin/rad"
	install -Dm755 "$srcdir/rad-web" "$pkgdir/usr/bin/rad-web"
	install -Dm755 "$srcdir/git-remote-rad" "$pkgdir/usr/bin/git-remote-rad"

	install -Dm644 "$srcdir/rad.1" "$pkgdir/usr/share/man/man1/rad.1"
	install -Dm644 "$srcdir/rad-patch.1" "$pkgdir/usr/share/man/man1/rad-patch.1"
	install -Dm644 "$srcdir/git-remote-rad.1" "$pkgdir/usr/share/man/man1/git-remote-add.1"
}
