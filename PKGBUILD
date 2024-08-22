# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NMF
_pkgver=0.28
pkgname=r-${_pkgname,,}
pkgver=0.28
pkgrel=1
pkgdesc='Algorithms and Framework for Nonnegative Matrix Factorization (NMF)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocmanager
  r-colorspace
  r-digest
  r-doparallel
  r-foreach
  r-ggplot2
  r-gridbase
  r-rcolorbrewer
  r-registry
  r-reshape2
  r-rngtools
  r-stringr
)
optdepends=(
  r-bigmemory
  r-corpcor
  r-devtools
  r-dompi
  r-fastica
  r-knitr
  r-mail
  r-runit
  r-synchronicity
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77dfe7b323ee5e5f8801851d1d4356932e2ffc810a7ac7faf5542cbfd92eeefb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
