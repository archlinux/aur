# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GARS
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('3e9e2c6ea7c55da37873c714d776bd5d919fb345dcbe095d8d3f3a3ca47d28c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
