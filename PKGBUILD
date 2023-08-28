# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=snakecase
_pkgver=0.11.1
pkgname=r-${_pkgname,,}
pkgver=0.11.1
pkgrel=1
pkgdesc='Convert Strings into any Case'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-stringi
  r-stringr
)
optdepends=(
  r-covr
  r-knitr
  r-magrittr
  r-purrrlyr
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a5f9791337ca42e392f23fb873eb44f74810583e9aa7c62fda2f28f9e750821')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
