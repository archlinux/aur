# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Jan Misiak <fijam@archlinux.ux>

pkgname=otf-exljbris
pkgver=1.0
_pkgver_delicious=21
_pkgver_diavlo=37b2
_pkgver_fontin_cyrillic=46b
_pkgver_fontin_sans=49
_pkgver_tallys=15b2
pkgrel=1
pkgdesc='A collection of free OpenType fonts by Jos Buivenga. Includes: Delicious, Diavlo, Fontin, Fontin Sans and Tallys'
arch=('any')
license=('custom')
url=https://exljbris.com
depends=('fontconfig' 'xorg-fonts-encodings')
source=("https://exljbris.com/dl/DELICIOUS_"$_pkgver_delicious"_OTF.zip"
    "https://exljbris.com/dl/Diavlo_II_"$_pkgver_diavlo".zip"
    'https://exljbris.com/dl/fontin_pc.zip'
    "https://exljbris.com/dl/FontinSans_"$_pkgver_fontin_sans".zip"
    "https://exljbris.com/dl/FontinSans_Cyrillic_"$_pkgver_fontin_cyrillic".zip"
    "https://exljbris.com/dl/tallys_"$_pkgver_tallys".zip"
    'exljbris-font-licence.txt')
b2sums=('bad3afc02687761ee3d00262f978d5644988b4359ddfd5ca874158fcba5db556ed1eabfdbd2021da25d4e31d7182e40aea3f196e93f93bc939cb415e9508ad0d'
        'e42ffe48ac23f4478f025fcccca6832b416dac391f9b9e9ebddde6de09daf115e8dbf422e6d0e3723a52abafa197c453976799f7a3c473935fd610e72aea23b4'
        'bf0952f5b9d7a36b15b6fc56c3bb92dd731f77afe83d4031f6e494e026039b196073c88032683c4db472663d4820a0f8d4ac98ff7bf825d9d2d53a21c9152536'
        'c5fa4391291c8b9a6444fb065ed15a73f52c9f227595c2e0b5a81a31957af3754373ac7e6a6bfbfe380c8091de1179d8aec460ab7fef64cdc449f152b18f894b'
        'e11d2e93052ba91a62439d4dfcbec7725de80bfd01c5d780c397868c01a89a47daf2eae85e8494c5b2ec8433d0e89f5b84ddeeb4781234689d8e9942a189cc9e'
        'a377da4605b38196c8d5088b996171a91c39493f06b2051aa8040d4dc4afbd66c2fe0d648a29f6575332006ebc6e826c655d85c7e463987647b8d784e0a60e5d'
        'a7719083f17487f7a5cac5291dcfa5d7688c897a1248c733c7fd4b5ae1f85c1ea8850dd15011172ee09346617cd9cfd7da60609541055874f45c80a0bfc1cdc2')

package() {
    mkdir -p "$pkgdir/usr/share/fonts/OTF"
    shopt -s globstar
    install -Dm644 ./**/*.otf "$pkgdir/usr/share/fonts/OTF"
    install -Dm644 exljbris-font-licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
