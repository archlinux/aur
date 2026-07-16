# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=slalom
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Factorial Latent Variable Modeling of Single-Cell RNA-Seq Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-ggplot2
  r-gseabase
  r-rcpp
  r-rcpparmadillo
  r-rsvd
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04cdf0107b88622a7a7e55cb6f72cec5950b18a978265d39d7355da06898bb85')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
