# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mhsmm
_pkgver=0.4.21
pkgname=r-${_pkgname,,}
pkgver=0.4.21
pkgrel=1
pkgdesc='Inference for Hidden Markov and Semi-Markov Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('293544afb194934b1d58cf88c6f8c372f537745514b6e428cf83ae62e87d2bba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
