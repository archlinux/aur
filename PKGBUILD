# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deconvR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Simulation and Deconvolution of Omic Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-assertthat
  r-biocgenerics
  r-data.table
  r-dplyr
  r-e1071
  r-foreach
  r-genomicranges
  r-iranges
  r-magrittr
  r-matrixstats
  r-methylkit
  r-minfi
  r-nnls
  r-quadprog
  r-rsq
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-doparallel
  r-ggplot2
  r-granulator
  r-knitr
  r-parallel
  r-refmanager
  r-reshape2
  r-rmarkdown
  r-roxygen2
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2358e1bfee30fa0164c609fdfb86101d34346a4dce7a416dfa9c6be414b7845e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
