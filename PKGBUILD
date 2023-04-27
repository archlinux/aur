# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msqrob2
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Robust statistical inference for quantitative LC-MS proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-limma
  r-lme4
  r-multiassayexperiment
  r-purrr
  r-qfeatures
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-gridextra
  r-knitr
  r-matrixstats
  r-mscoreutils
  r-msdata
  r-msnbase
  r-multcomp
  r-plotly
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66b71137c17357dc99963189087f6609a0eedb00b343180905972646d413e96a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
