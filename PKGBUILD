# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doRNG
_pkgver=1.8.6.2
pkgname=r-${_pkgname,,}
pkgver=1.8.6.2
pkgrel=1
pkgdesc="Generic Reproducible Parallel Backend for 'foreach' Loops"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
  r-iterators
  r-rngtools
)
optdepends=(
  r-covr
  r-devtools
  r-dompi
  r-doparallel
  r-doredis
  r-knitr
  r-pkgmaker
  r-rbenchmark
  r-rbibutils
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6683baec10cf8f6a44620d95ef06fec60b3f7911100827e392774a2ebdad7e8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
