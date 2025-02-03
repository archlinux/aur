# system requirements: C++11, gmp (>= 4.2.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppAlgos
_pkgver=2.9.3
pkgname=r-${_pkgname,,}
pkgver=2.9.3
pkgrel=1
pkgdesc='High Performance Tools for Combinatorics and Computational Mathematics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cpp11
  r-gmp
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-partitions
  r-rcppbigintalgos
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cde93d5756989229b6959483b82ef6dd90f4c6f452ae5123e48fd10e62530a9f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
