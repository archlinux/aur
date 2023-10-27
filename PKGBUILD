# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADImpute
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('e1a05cce0d16c805370fff40cf3f950c19ac6bcfd570b1da39054961a3f72909')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
