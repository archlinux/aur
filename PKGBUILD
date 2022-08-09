# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=3.38.4
pkgname=r-${_pkgname,,}
pkgver=3.38.4
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
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-splines
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c61a193a02a5ff2defa9109031b446c5bea98c44648a1edbc135e3f4724f86f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
