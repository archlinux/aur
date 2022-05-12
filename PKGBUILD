# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=sts
pkgname=nist-$_pkgname
pkgver=2.1.2
pkgrel=1
pkgdesc="NIST Statistical Test Suite (STS)"
url="https://csrc.nist.gov/projects/random-bit-generation/documentation-and-software"
arch=('x86_64')
license=('custom:public-domain')
source=("https://csrc.nist.gov/CSRC/media/Projects/Random-Bit-Generation/documents/sts-2_1_2.zip")
b2sums=("e81951d3420ff3220f60789340ffaa23c5430ed0008292b43a339fd0be9472080a6bb1ff3bf773c653a10a3ab7e337cc28bed74f6b501494925a60520960d76e")

build() {
    cd "$_pkgname-$pkgver/$_pkgname-$pkgver"
    make
}

package() {
    cd "$_pkgname-$pkgver/$_pkgname-$pkgver"
    install -Dm755 assess "$pkgdir/usr/bin/nist-sts"
}
