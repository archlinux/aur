# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adductomicsR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Processing of adductomic mass spectral datasets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-adductdata
  r-ade4
  r-annotationhub
  r-bootstrap
  r-data.table
  r-dosnow
  r-dplyr
  r-dt
  r-experimenthub
  r-fastcluster
  r-foreach
  r-fpc
  r-mzr
  r-orgmassspecr
  r-pastecs
  r-pracma
  r-rcppeigen
  r-reshape2
  r-rvest
  r-smoother
  r-zoo
)
optdepends=(
  r-knitr
  r-rdisop
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d695beed6a38fcde88a8c9b36705e1fc9ab91418364014cbac7c71256c31959d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
