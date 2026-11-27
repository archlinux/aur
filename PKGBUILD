# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=4.8.0
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
  r-gson
  r-memoise
  r-reshape2
  r-yulab.utils
)
optdepends=(
  r-aisdk
  r-clusterprofiler
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-quarto
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b98a05c81402acdfa31abe79d945079c')
b2sums=('f787233213b9272d35bb8db0e111aa6c770f0c1213009be2d1c93e93495cdec82b54a42d497a8de280bc314745abab4f25e8cd03433abd5d86faa053108650eb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
