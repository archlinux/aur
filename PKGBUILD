# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lhs
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=1.1.6
pkgrel=1
pkgdesc='Latin Hypercube Samples'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-assertthat
  r-doe.base
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e37fce44efe6a371677ba2f72f9e1e48270a0fdc60872d05def89270586cd23f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
