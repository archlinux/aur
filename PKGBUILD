# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrganismDbi
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Software to enable the smooth interfacing of different database packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-dbi
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-iranges
  r-rbgl
  r-s4vectors
)
optdepends=(
  r-annotationhub
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-fdb.ucsc.trnas
  r-homo.sapiens
  r-mirbase.db
  r-rattus.norvegicus
  r-rmariadb
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9b3e40d252a8d15c50c9444e147b10d3a6474c0d4852092d36957d27c5474f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
