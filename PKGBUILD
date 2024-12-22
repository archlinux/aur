# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=4.0.0
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
md5sums=('01b762c6bd25214fd4fa713df1da6e52')
b2sums=('03a61718bae14a5e6055d6c4b0c2b262cd9394c1a05f45b4d5b79863e65f9fa037efcc7e889cd80861ad3db6b2b61a78d0f82da14890c07a9ba26052f2c8c211')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
