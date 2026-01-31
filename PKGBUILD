# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bayesrules
_pkgver=0.0.3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
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
sha256sums=('5a43806ed8afb59bce420bbf3f07e13cc64400fa21a4fb93e65cc72395faa3b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
