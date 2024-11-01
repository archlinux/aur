# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RnBeads.hg38
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RnBeads.hg38"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('43ecf19a9513772a76d0470d1dae9366')
b2sums=('f2deee8f9207e071f1a94988ed9056f1d28cb95f430a235cc4b1c90c6bb770c414da3560ffa23cf7a28f0fddc0c83c96ec68398add68a690d95397cfbe74c721')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
