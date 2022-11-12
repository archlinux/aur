# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msqrob2
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
sha256sums=('878209e1c820b462ce81eaeb0e4b6ff23bd0c0c3d85bcfbd1a26f12e67f155d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
