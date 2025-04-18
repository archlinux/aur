# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Glimma
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='Interactive HTML graphics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-deseq2
  r-edger
  r-htmlwidgets
  r-jsonlite
  r-limma
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-genomicranges
  r-iranges
  r-knitr
  r-pryr
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8293e646273d017a19b5adaaeaa424cd061dede88f8ff533a6bbb5a10f3d3dd7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
