# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VIM
_pkgver=6.2.2
pkgname=r-${_pkgname,,}
pkgver=6.2.2
pkgrel=3
pkgdesc='Visualization and Imputation of Missing Values'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-colorspace
  r-data.table
  r-e1071
  r-laeken
  r-magrittr
  r-ranger
  r-rcpp
  r-robustbase
  r-sp
  r-vcd
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-reactable
  r-rmarkdown
  r-tinytest
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('afa7492c54508c46eff39ac66fa4b05627e0044253ebe4a61b2a78d459f715e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
