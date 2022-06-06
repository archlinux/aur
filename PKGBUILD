# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GARS
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='GARS: Genetic Algorithm for the identification of Robust Subsets of variables in high-dimensional and challenging datasets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-damirseq
  r-ggplot2
  r-mlseq
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54bac33f5e19341a08fafae9d40483b3db9a2a0faa6f5eb0b824eb2ff6d077ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
