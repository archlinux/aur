# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=4.0.1
pkgname=r-${_pkgname,,}
pkgver=4.0.1
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
  r-biocstyle
  r-jsonlite
  r-knitr
  r-matrix
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-seuratobject
  r-splines
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10328b2f203b971a81f053ede4e21a879b3f6e94c743bd21c8ebd0af246f5e6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
