# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bayesrules
_pkgver=0.0.2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=1
pkgdesc='Datasets and Supplemental Functions from Bayes Rules! Book'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-e1071
  r-ggplot2
  r-groupdata2
  r-janitor
  r-magrittr
  r-purrr
  r-rstanarm
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8bc801d95109c8e38867ffd9036566ce53f974601883d60b4a3eab90b00a2a28')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
