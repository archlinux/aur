# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atena
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Analysis of Transposable Elements'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-matrixstats
  r-rsamtools
  r-s4vectors
  r-sparsematrixstats
  r-squarem
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cffe3ee62e8564012ec6cfa5e514a37eab1d2c10ce07eec4e80b16d3ccf1cfe1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
