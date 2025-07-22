# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCMCprecision
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
pkgdesc='Precision of Discrete Parameters in Transdimensional MCMC'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-rcppprogress
)
optdepends=(
  r-r.rsp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc2109165a7f147e7d2a782774617e328282e10cf2e0a54a2ef1bf064db9fa04')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
