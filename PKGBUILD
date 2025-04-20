# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cfdnakit
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fragmen-length analysis package from high-throughput sequencing of cell-free DNA (cfDNA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-pscbs
  r-qdnaseq
  r-rlang
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c99e84a52eb8c2e6c4fa21882f2d009')
b2sums=('8e67dbdabdec19f542d2928befbbfa63c39d6fb0f262bf21880a155cac682480c450b62fffadfa0a6e2800dc93bbff3a2fb4633091ec82833e644613583ab40c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
