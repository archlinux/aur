# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240313
_srchash="54aacc96197a48b79fcc260f94312d824f5e0a34"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/54aacc96197a48b79fcc260f94312d824f5e0a34/LICENSE-MIT"
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
	'e6dd5db77d651fbcfaaf687bacb1c9ea97a5489a8de72fee18e6e60c44330984'
	'18cc17650942ac6b1b621244aaf0e097282f01021d09730731be7d71469639ef'
	'0efafc93015f18da8c0a67d02b971f0573f443ee717f5e4cbb02ff423fc910d4'
	'18b7582f3b99e93c58774194efead43e4529f001ef9974dc9342cf10a9ece553'
	'49e4d43ed0f49c173eea93b3907d9eb88881e5ec334911dd86404626ec33fabf'
	'cf3e3086765f0cb552f1b0745eb0717bd03a32ab24131c8097ca4cda6e02e71a'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'91491c3ab52f01e2fa60a0f8e801a898f50c48707e3fa96bde94406d2ec55204'
	'7d076fddde7eba9341ea61f99398416310aa255015a301bd8e25dfe6754fed59'
	'0cea04cb031e299e888f8cb5f380e7db22c571f9eb908ba2e8d3f3b3137c4043'
	'3f97b2ec7e816797f46c0ee8e3263e6856f8f4f81710dc43377cb4a25be2f928'
	'5e1d36927852494c8f7b914df0ee4ebfe6225b21a41ce115e92a44f52eed5bec'
	'a084ede023fc9a87773b66a833a5998ee7d5eea5bee8c829dc4f30fabe00584c'
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
