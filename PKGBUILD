# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSgalgoR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='An Evolutionary Framework for the Identification and Study of Prognostic Gene Expression Signatures in Cancer'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-doparallel
  r-foreach
  r-matchingr
  r-nsga2r
  r-proxy
)
optdepends=(
  r-biobase
  r-biocstyle
  r-breastcancertransbig
  r-breastcancerupp
  r-genefu
  r-ggplot2
  r-ic10trainingdata
  r-knitr
  r-pamr
  r-rmarkdown
  r-survcomp
  r-survminer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e336454c7e589aad63af8c4e1ceb8dd9b903f3af6aa06a61ff82319f0be726f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
