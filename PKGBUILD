# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SplicingGraphs
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Create, manipulate, visualize splicing graphs, and assign RNA-seq reads to them'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-igraph
  r-iranges
  r-rgraphviz
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-gviz
  r-igraph
  r-rnaseqdata.hnrnpc.bam.chr14
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('645c7406148182200352240d554df82b1fdf24a4a69a092a26b8357589695ed9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
