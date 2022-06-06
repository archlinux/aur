# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=microbiomeMarker
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=1
pkgdesc='microbiome biomarker analysis toolkit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aldex2
  r-ancombc
  r-biobase
  r-biocgenerics
  r-biomformat
  r-biostrings
  r-caret
  r-coin
  r-complexheatmap
  r-deseq2
  r-dplyr
  r-edger
  r-ggplot2
  r-ggsignif
  r-ggtree
  r-iranges
  r-limma
  r-magrittr
  r-metagenomeseq
  r-multtest
  r-patchwork
  r-phyloseq
  r-plotroc
  r-purrr
  r-rlang
  r-s4vectors
  r-tibble
  r-tidyr
  r-tidytree
  r-yaml
)
optdepends=(
  r-biocstyle
  r-covr
  r-e1071
  r-glmnet
  r-kernlab
  r-knitr
  r-matrix
  r-ranger
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cdf22c92d60a19281ce7f4193a524d6307ae16240c0a2b53a3a9a2696fed71c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
