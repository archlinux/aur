# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabolomicsWorkbenchR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('0d6f1bda8bce226f14eaf9681005f2ce3c61104bf29d2c0356e244cc596b64fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
