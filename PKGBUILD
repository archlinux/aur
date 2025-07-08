# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biosigner
_pkgver=1.36.4
pkgname=r-${_pkgname,,}
pkgver=1.36.4
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
sha256sums=('d0c0f4b2bd56574d1369233f6284a06e2621ff95636aab4ff1a816f0344539fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
