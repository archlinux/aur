# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMwR2
_pkgver=0.0.2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc='Functions and Data for the Second Edition of "Data Mining with R"'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
  r-dplyr
  r-quantmod
  r-readr
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2902e83a8bd8b37c478c71eba005b436a7b4f2136dbc78a1c8481630c55feeef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
