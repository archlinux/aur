# system requirements: Python (>= 2.7.0)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=reticulate
_pkgver=1.27
pkgname=r-${_pkgname,,}
pkgver=1.27
pkgrel=1
pkgdesc="Interface to 'Python'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-here
  r-jsonlite
  r-png
  r-rappdirs
  r-rcpp
  r-withr
  python
  r-rcpptoml
)
optdepends=(
  r-callr
  r-knitr
  r-rlang
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9d568457a14a96be9d6956b8dffde59ca579de4baecef4c4b93f513ac83369a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
