# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=covr
_pkgver=3.5.1
pkgname=r-${_pkgname,,}
pkgver=3.5.1
pkgrel=4
pkgdesc='Test Coverage for Packages'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-crayon
  r-digest
  r-httr
  r-jsonlite
  r-rex
  r-withr
  r-yaml
)
optdepends=(
  r-curl
  r-dt
  r-htmltools
  r-knitr
  r-memoise
  r-mockery
  r-parallel
  r-r6
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a54cfc3623ea56084158ac5d7fe33f216f45191f6dcddab9c9ed4ec1d9d8ac6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
