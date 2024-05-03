# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mCSEA
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Methylated CpGs Set Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-fgsea
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gviz
  r-homo.sapiens
  r-iranges
  r-limma
  r-mcseadata
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-biocstyle
  r-flowsorted.blood.450k
  r-knitr
  r-leukemiaseset
  r-minfi
  r-minfidata
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc73678d4bff6dfaf9c14fe3237f5437b92d0b50e07efb639eb5ed098a08bd86')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
