# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=text2vec
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=3
pkgdesc='Modern Text Mining Framework for R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-digest
  r-lgr
  r-mlapi
  r-r6
  r-rcpp
  r-rsparse
  r-stringi
)
optdepends=(
  r-covr
  r-glmnet
  r-knitr
  r-magrittr
  r-proxy
  r-rmarkdown
  r-testthat
  r-udpipe
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f10aa50abee9f4b0dc686126dace49594f5417c9e9662338d4168602c2c83a2e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
