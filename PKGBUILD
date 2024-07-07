# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabolomicsWorkbenchR
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=1
pkgdesc='Metabolomics Workbench in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-httr
  r-jsonlite
  r-multiassayexperiment
  r-struct
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-grid
  r-hdf5array
  r-httptest
  r-knitr
  r-pmp
  r-png
  r-rmarkdown
  r-structtoolbox
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f1ed7303f7cc1e700cc7fb656ec9400a94e7b6b6a7d5b50a04ab6e7b7f5a43aa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
