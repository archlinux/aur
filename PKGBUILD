# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=minfiData
_pkgver=0.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Example data for the Illumina Methylation 450k array"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-minfi
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ca7578aeab1a54db146c443870be6e7')
b2sums=('b6816c8015890dddb13608a5c451c7bc33f0a98de8a44ca6bdbd278d8372d3ea2bc0d82705f108d52644d214b60f316e4ce64ef17d090b815de34577f757a4cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
