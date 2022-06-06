# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msm
_pkgver=1.6.9
pkgname=r-${_pkgname,,}
pkgver=1.6.9
pkgrel=4
pkgdesc='Multi-State Markov and Hidden Markov Models in Continuous Time'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-expm
  r-mvtnorm
)
optdepends=(
  r-doparallel
  r-flexsurv
  r-foreach
  r-minqa
  r-mstate
  r-numderiv
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aefcd9bb40b0167311d088d6fe23fdf7aa35deaac0f8b47ef02377cff5577023')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
