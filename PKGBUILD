# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NMF
_pkgver=0.24.0
pkgname=r-${_pkgname,,}
pkgver=0.24.0
pkgrel=3
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
  r-pkgmaker
  r-rcolorbrewer
  r-registry
  r-reshape2
  r-rngtools
  r-stringr
)
optdepends=(
  r-bibtex
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
sha256sums=('481811d35b3bbc07e9a60e2f853b05ef26581b43be9c6c4bab81151b8dcadd93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
