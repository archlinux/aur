# system requirements: C++11, gmp (>= 4.2.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppAlgos
_pkgver=2.7.2
pkgname=r-${_pkgname,,}
pkgver=2.7.2
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
sha256sums=('c571e061efa67c7af0ad66f01aa0f8dffb441967df0c06e6da42679ef6e2dcf1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
