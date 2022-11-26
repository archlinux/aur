# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcisTarget
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=1.17.0
pkgrel=3
pkgdesc='RcisTarget Identify transcription factor binding motifs enriched on a list of genes or genomic regions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arrow
  r-aucell
  r-biocgenerics
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-gseabase
  r-r.utils
  r-s4vectors
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biobase
  r-biocparallel
  r-biocstyle
  r-domc
  r-doparallel
  r-dorng
  r-dt
  r-foreach
  r-gplots
  r-igraph
  r-knitr
  r-rcistarget.hg19.motifdbs.cisbponly.500bp
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-visnetwork
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('73e760910a90d8ddfc6734f06be201fe6923edb83573ff3eb0029b438a8ddcaa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
