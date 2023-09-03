# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=LambertW
_pkgver=0.6.8
pkgname=r-${_pkgname,,}
pkgver=0.6.8
pkgrel=1
pkgdesc='Probabilistic Models to Analyze and Gaussianize Heavy-Tailed, Skewed Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-lamw
  r-rcolorbrewer
  r-rcpp
  r-reshape2
)
optdepends=(
  r-boot
  r-data.table
  r-knitr
  r-markdown
  r-moments
  r-nortest
  r-numderiv
  r-rsolnp
  r-testthat
  r-vars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0a5e50e6200d553fe9d02be99c001e61e8d0be2b4396f311bda8364bc8d79882')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
