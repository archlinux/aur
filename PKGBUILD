# Maintainer: tippfehlr <tippfehlr at gmail dot com>
# Contributor: Adam Szkoda <adaszko at gmail dot com>

pkgname=radicle-cli-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240212
_srchash="9767b485c2aad1e23097d2b5165287ba84cfa452"
pkgrel=1
pkgdesc="cli for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/9767b485c2aad1e23097d2b5165287ba84cfa452/LICENSE-MIT"
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
	'bd5bb8582e9fac11cd8e04940e2fd5891d3c6d23771c014866e9da8c1b8ebd0b'
	'd770e374294477f0e6f0f0756afad31b08d4a50f30b0a791bcfbab4ac36999fd'
	'9556578cde0c02fa7c717603fd012271af8704d4c98d5e7932a96913a4711fb2'
	'7a06c6911ab8025d46c7bced376680eb05f3ccab64402010c18e028e228773f9'
	'3c60405e4dc9e4c4836356fde8b258a105265e0fa11da7cbc8f3e5339e260b91'
	'3decf4f3ee9664c66fa1d6d926002a05dc1d5ae0dda1c0feb9dadc0355cd8622'
	$_license_sha256sum
)
sha256sums_aarch64=(
	'6a83e2aee803a1e7860dbcc97929a5373770f675f281ff7dd46bd4bdb9f88b99'
	'59f942c603fcabf7fce3f8a91d0a385c6b95f751e77efdb5ef941419efe38f82'
	'5f757cc7925cac19e23240737e941816c9a3bba7c047b5a9e58b9851f1f16556'
	'0987ea073ffde348f76d62b83a8d2ad36ab580c41184e1692824491cad70286b'
	'16bf4ec3d86bfd94c30fdedbae79ce90d53c628434aa3924d72226c00e69f81d'
	'9965a3a678df94d6d17637d33cf0105ace8483d7e368f72f462c5fb335163805'
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
