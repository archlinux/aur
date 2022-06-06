# system requirements: JAGS (http://mcmc-jags.sourceforge.net)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2jags
_pkgver=0.7-1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=4
pkgdesc="Using R to Run 'JAGS'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-coda
  r-r2winbugs
  r-rjags
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b097261c0b20b89a021bbc5087523a24f17249fa14c527cd54c5e5b2970226a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
