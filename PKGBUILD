# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=immunotation
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Tools for working with diverse immune genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-ggplot2
  r-maps
  r-ontologyindex
  r-readr
  r-rlang
  r-rvest
  r-stringr
  r-tidyr
  r-xml2
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3aba8ba4fc283e05f2ffff76e3738dcf88781e535d65d3ea9a627d3e7674ee6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
