# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.0.0
pkgname=r-${_pkgname,,}
pkgver=4.0.0
pkgrel=1
pkgdesc='Empirical Analysis of Digital Gene Expression Data in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-locfit
  r-rcpp
  gcc
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-jsonlite
  r-matrix
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-seuratobject
  r-splines
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87fcd239c5beb80a607eb85e00e2afc04eb36b99c90f6978f024d01e01989f2b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
