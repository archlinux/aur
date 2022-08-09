# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FLAMES
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=1
pkgdesc='FLAMES: Full Length Analysis of Mutations and Splicing in long read RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-basilisk
  r-dplyr
  r-magrittr
  r-rcpp
  r-reticulate
  r-rhtslib
  r-rsamtools
  r-s4vectors
  r-scater
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-tidyr
  r-zlibbioc
  r-complexheatmap
  r-rtracklayer
  r-igraph
  r-ggbio
  r-scran
  r-genomicfeatures
  r-circlize
  r-cowplot
  r-stringr
  r-bambu
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2e6b256548b9f3eba35d9d6f7fb2f4d051dbc0438e1096b7d524cb807bb61b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
