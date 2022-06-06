# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSRchitect
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=3
pkgdesc='Promoter identification from large-scale TSS profiling data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gtools
  r-iranges
  r-readxl
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-encodexplorer
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('31c50f0af34aee8c22b2847451774510194863a2896c86d2f793e7e42dfa3fed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
