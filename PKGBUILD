# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpgraph
_pkgver=2.32.2
pkgname=r-${_pkgname,,}
pkgver=2.32.2
pkgrel=1
pkgdesc='Estimation of genetic and molecular regulatory networks from high-throughput genomics data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocparallel
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-iranges
  r-mvtnorm
  r-qtl
  r-rgraphviz
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-category
  r-genefilter
  r-gostats
  r-org.eck12.eg.db
  r-rlecuyer
  r-runit
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08f6690eb50ff6e6745747473cc703cda7833d138e4532f26cb89676f9d48f51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
