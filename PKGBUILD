# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=babelgene
_pkgver=22.9
pkgname=r-${_pkgname,,}
pkgver=22.9
pkgrel=3
pkgdesc='Gene Orthologs for Model Organisms in a Tidy Data Format'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-rlang
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce6601dcb78352516d3b0355042c52a20e154b39d3b27b93ff52150a59c885e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
