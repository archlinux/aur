# system requirements: A compiler with C++11 support for the threadlibrary, Requires Rtools >= 33 (i.e. R >= 3.3.0) to build onWindows.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NetRep
_pkgver=1.2.8
pkgname=r-${_pkgname,,}
pkgver=1.2.8
pkgrel=1
pkgdesc='Permutation Testing Network Module Preservation Across Datasets'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-bh
  r-foreach
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-rhpcblasctl
  r-statmod
  gcc
)
optdepends=(
  r-bigmemory
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('31c7bba79ab6676c23cf69a380dd0c6bfa4b1e8fbd3dc41c1b19bd9523a0dbf3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
