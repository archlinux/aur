# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoreGx
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc="Classes and Functions to Serve as the Basis for Other 'Gx' Packages"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-crayon
  r-data.table
  r-glue
  r-lsa
  r-matrixgenerics
  r-multiassayexperiment
  r-piano
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-bench
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-markdown
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0504414a595f0293ee8b6ad0fdb32cd927d8e031f014934baca91cee5489cb39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
