# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AhoCorasickTrie
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=1
pkgdesc='Fast Searching for Multiple Keywords in Multiple Texts'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-rcpp
  gcc
)
optdepends=(
  r-biostrings
  r-microbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2a3314310ba6b70352b066974bdfeaf7ba9fccb15ef97affc47ac4c7ec99abb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
