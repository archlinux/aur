# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=4.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Ontology Semantic and Enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocparallel
  r-fgsea
  r-ggplot2
  r-gosemsim
  r-qvalue
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
md5sums=('cce36c5300ea4e05a0b70b5a78a9cbf2')
b2sums=('450ef8ecda4957d870496d1d1a2eef857003ec2c6646d6ca69303580ccfb44b183930b629841cfa8401f70e86ab944b02464109961fbfb286d925548361d98ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
