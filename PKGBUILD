# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DRIMSeq
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Differential transcript usage and tuQTL analyses with Dirichlet-multinomial model in RNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-edger
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-reshape2
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-geuvadistranscriptexpr
  r-grid
  r-knitr
  r-pasillatranscriptexpr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28f1cc6a43f2ba96b93749a689f7d928e323245dca79c627a595a417c66534c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
