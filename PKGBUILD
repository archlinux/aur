# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADImpute
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Adaptive Dropout Imputer (ADImpute)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-checkmate
  r-data.table
  r-drimpute
  r-kernlab
  r-rsvd
  r-s4vectors
  r-saver
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('571a23486f7f9ce752e78a3a6fb6cbdfa8959e3a070481f5a3483ce3e6227928')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
