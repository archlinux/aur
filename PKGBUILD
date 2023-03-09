# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=partykit
_pkgver=1.2-18
pkgname=r-${_pkgname,,}
pkgver=1.2.18
pkgrel=1
pkgdesc='A Toolkit for Recursive Partytioning'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-formula
  r-inum
  r-libcoin
  r-mvtnorm
)
optdepends=(
  r-aer
  r-coin
  r-datasets
  r-mlbench
  r-parallel
  r-party
  r-pmml
  r-psychotools
  r-psychotree
  r-randomforest
  r-rjava
  r-rweka
  r-sandwich
  r-strucchange
  r-th.data
  r-vcd
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c3f8ba0eaa38268565d006954d6f45a172e29e81b8e2ad86a0ec4b5d41464fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
