# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doRNG
_pkgver=1.8.6.3
pkgname=r-${_pkgname,,}
pkgver=1.8.6.3
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
sha256sums=('7a5db1806f3529e2e60f49921790b3bbca7ebcedc7301627a1a404b4fe251d51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
