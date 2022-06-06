# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabolomicsWorkbenchR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
  r-knitr
  r-pmp
  r-png
  r-rmarkdown
  r-structtoolbox
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88510d5e8b37f0e7c58f36d51c179638017178e1d9a6130e0f613f8c5ee6e755')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
