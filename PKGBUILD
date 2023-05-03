# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pkgmaker
_pkgver=0.32.10
pkgname=r-${_pkgname,,}
pkgver=0.32.10
pkgrel=1
pkgdesc='Development Utilities for R Packages'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-digest
  r-registry
  r-stringr
  r-withr
  r-xtable
)
optdepends=(
  r-biobase
  r-datasets
  r-devtools
  r-knitr
  r-markdown
  r-rbibutils
  r-rmarkdown
  r-roxygen2
  r-runit
  r-testthat
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('972b0473a64408ccc4841fa3f09a567cc32811e69c3c7e42a2f391a5eb2e2933')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
