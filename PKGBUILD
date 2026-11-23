# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CluMSID
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Clustering of MS2 Spectra for Metabolite Identification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ape
  r-biobase
  r-dbscan
  r-ggally
  r-ggplot2
  r-gplots
  r-msnbase
  r-mzr
  r-network
  r-plotly
  r-rcolorbrewer
  r-s4vectors
  r-sna
)
optdepends=(
  r-clumsiddata
  r-dplyr
  r-knitr
  r-magrittr
  r-metams
  r-metamsdata
  r-readr
  r-rmarkdown
  r-stringr
  r-testthat
  r-xcms
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1878efb362d2e1050d0bc03616bde9caf46c3dc029a24763e0eae438f1352bac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
