# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MsCoreUtils
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
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
  r-hdf5array
  r-impute
  r-imputelcmd
  r-knitr
  r-matrix
  r-missforest
  r-norm
  r-norm2
  r-pcamethods
  r-preprocesscore
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab3f627632e79c7d709ab45eb8beaac37470d6d453cc82b36789cea673034cba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
