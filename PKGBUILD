# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InteractionSet
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
pkgrel=1
pkgdesc='Base Classes for Storing Genomic Interaction Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad7cc6801d88858801fcf855a95788587834a513bef1d0a4bf39e6b5149468da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
