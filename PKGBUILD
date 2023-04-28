# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicOZone
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Delineate outstanding genomic zones of differential gene activity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biomart
  r-ckmeans.1d.dp
  r-genomeinfodb
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-gridextra
  r-iranges
  r-lsr
  r-plyr
  r-rdpack
  r-s4vectors
)
optdepends=(
  r-geoquery
  r-knitr
  r-readxl
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13e1d7a27b5b1310721b9f34d2fa9c8fe0d3ed481799dbe711e2f16bb1108e4c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
