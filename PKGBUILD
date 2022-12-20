# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=keras
_pkgver=2.11.0
pkgname=r-${_pkgname,,}
pkgver=2.11.0
pkgrel=1
pkgdesc="R Interface to 'Keras'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ellipsis
  r-generics
  r-glue
  r-magrittr
  r-r6
  r-reticulate
  r-rlang
  r-tensorflow
  r-tfruns
  r-zeallot
)
optdepends=(
  r-callr
  r-ggplot2
  r-jpeg
  r-knitr
  r-png
  r-rmarkdown
  r-testthat
  r-tfdatasets
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77d3c3c9cc77a279037a5fc253ea9346890ea5a5ee73a78f4b80b6db690d21a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
