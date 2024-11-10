# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentSubset
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Manages subsets of data with Bioconductor Experiment objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-s4vectors
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
  r-treesummarizedexperiment
)
optdepends=(
  r-airway
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-scater
  r-scds
  r-scran
  r-stats
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfe8fd78c822f8e8e59d3f989a7821b537f7588ab8de4f55b99e6ee81dc6e146')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
