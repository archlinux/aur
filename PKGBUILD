# system requirements: Ensembl VEP, Samtools
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MMAPPR2
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=4
pkgdesc='Mutation Mapping Analysis Pipeline for Pooled RNA-Seq'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-dplyr
  r-ensemblvep
  r-genomeinfodb
  r-genomicranges
  r-gmapr
  r-iranges
  r-magrittr
  r-rsamtools
  r-s4vectors
  r-stringr
  r-tidyr
  r-variantannotation
  r-varianttools
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mmappr2data
  r-mockery
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9cd249022e557ea7204dd410da4d208201b2aebaf6d1b7f753edd7854960af1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
