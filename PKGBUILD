# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicOZone
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('68700fac97a1141544b9c9666b33ea905e9eb337f84c0f6cfa984ccb390621b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
