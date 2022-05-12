# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=sts
pkgname=nist-$_pkgname
pkgver=2.1.2
pkgrel=2
pkgdesc="NIST Statistical Test Suite (STS)"
url="https://csrc.nist.gov/projects/random-bit-generation/documentation-and-software"
arch=('x86_64')
license=('custom:public-domain')
source=(
    "https://csrc.nist.gov/CSRC/media/Projects/Random-Bit-Generation/documents/sts-2_1_2.zip"
    "nist-sts-create-experiment.sh"
)
b2sums=(
    "e81951d3420ff3220f60789340ffaa23c5430ed0008292b43a339fd0be9472080a6bb1ff3bf773c653a10a3ab7e337cc28bed74f6b501494925a60520960d76e"
    "ebc8a4222612eb12e8eedb97174117df797d3af5d88592604c14c9c381a7c93e2888c50c08cde111f1f12ad68a600374fb54d9702c1a04f2ca8febc60842a7a9"
)

build() {
    cd "$_pkgname-$pkgver/$_pkgname-$pkgver"
    make
}

package() {
    install -Dm755 "$_pkgname-$pkgver/$_pkgname-$pkgver/assess" "$pkgdir/usr/bin/nist-sts"
    install -Dm755 nist-sts-create-experiment.sh "$pkgdir/usr/bin/"
}
