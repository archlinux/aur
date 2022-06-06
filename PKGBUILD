# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MsCoreUtils
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Core Utils for Mass Spectrometry Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-clue
  r-rcpp
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-impute
  r-imputelcmd
  r-knitr
  r-norm
  r-pcamethods
  r-preprocesscore
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f0f7d14b2d8560043a06dcad0c957d4c2070922cc7caa7ea54a81fe1d90ffd1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
