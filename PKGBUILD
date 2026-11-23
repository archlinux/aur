# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=4.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Ontology Semantic and Enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-enrichit
  r-ggplot2
  r-gosemsim
  r-reshape2
  r-yulab.utils
)
optdepends=(
  r-clusterprofiler
  r-gson
  r-knitr
  r-memoise
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('43e362425afb697b04fef6e58d59608e')
b2sums=('cdaa0755a108fe3ca02002da4ae77e0147b2ac00eb3f0fd08b0408a62fb8e1c571877552a86c7c24cb1f26be105201ff427c0c52553a31e715a6b6bc68eb1afa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
