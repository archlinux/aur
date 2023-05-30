# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringfish
_pkgver=0.15.8
pkgname=r-${_pkgname,,}
pkgver=0.15.8
pkgrel=1
pkgdesc='Alt String Implementation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcppparallel
)
optdepends=(
  r-dplyr
  r-knitr
  r-qs
  r-rlang
  r-rmarkdown
  r-stringr
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dfb21e2941b1884f5ee1f2d286b986bb4b7f607eb68edc3f0c5a7079da88839b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
