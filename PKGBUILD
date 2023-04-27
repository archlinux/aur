# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=padma
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Individualized Multi-Omic Pathway Deviation Scores Using Multiple Factor Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-factominer
  r-multiassayexperiment
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-car
  r-cowplot
  r-ggplot2
  r-ggrepel
  r-keggrest
  r-knitr
  r-missmda
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb74da06d2ce9669717bc4daf2ed7ee80068194fed95820793147349670484c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
