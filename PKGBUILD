# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=repo
_pkgver=2.1.5
pkgname=r-${_pkgname,,}
pkgver=2.1.5
pkgrel=4
pkgdesc='A Data-Centered Data Flow Manager'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
)
optdepends=(
  r-igraph
  r-knitr
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c9910453465c1ec3a899b16596a9f2b30187045cc5b86bc2ad44af79869aed8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
