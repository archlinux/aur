# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sjlabelled
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=3
pkgdesc='Labelled Data Utility Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-insight
  r-datawizard
)
optdepends=(
  r-dplyr
  r-haven
  r-knitr
  r-magrittr
  r-rlang
  r-rmarkdown
  r-sjmisc
  r-sjplot
  r-snakecase
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('731c7e907361971dbc890ad80bc95a38ecc38455a0217fdbc3dbb7c60b3648ed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
