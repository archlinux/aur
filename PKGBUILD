# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=labelled
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='Manipulating Labelled Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-haven
  r-lifecycle
  r-rlang
  r-stringr
  r-tidyr
  r-vctrs
)
optdepends=(
  r-covr
  r-knitr
  r-memisc
  r-questionr
  r-rmarkdown
  r-snakecase
  r-spelling
  r-testthat
  r-utf8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e93e29dcbbf0f6273b502b744695426e238ffe106f1db2bb5daeb1f17c9c40a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
