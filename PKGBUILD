# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biosigner
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Signature discovery from omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CeCILL')
depends=(
  r
  r-biobase
  r-e1071
  r-multiassayexperiment
  r-multidataset
  r-randomforest
  r-ropls
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biomark
  r-golubesets
  r-hu6800.db
  r-knitr
  r-omicade4
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b9c76fcb5ed501e63a3f0dd7e15214c47e0528880ec6ef3ceecdbd5a65daa5bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
