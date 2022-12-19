# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doRNG
_pkgver=1.8.3
pkgname=r-${_pkgname,,}
pkgver=1.8.3
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
  r-bibtex
  r-devtools
  r-dompi
  r-doparallel
  r-doredis
  r-knitr
  r-pkgmaker
  r-rbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8c84046970568a7b4eade1e5ba629f967cf061c8365a5e997e4f196688f11fab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
