# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=snakecase
_pkgver=0.11.0
pkgname=r-${_pkgname,,}
pkgver=0.11.0
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
sha256sums=('998420a58391ac85785e60bcdf6fd6927c82758ad2859a9a73a0e57299e8c1cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
