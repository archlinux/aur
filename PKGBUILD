# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringfish
_pkgver=0.15.7
pkgname=r-${_pkgname,,}
pkgver=0.15.7
pkgrel=3
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
sha256sums=('34b1703a8876a40860d35f88a94e069832a7d2bc86189ff07af84ff04fd4b735')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
