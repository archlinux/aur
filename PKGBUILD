# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celldex
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=1
pkgdesc='Reference Index for Cell Types'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-delayedarray
  r-delayedmatrixstats
  r-experimenthub
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a0f655a9506d64a86faa6a40a19dd8bc49bc6d09933b43ec4d218fa220388a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
