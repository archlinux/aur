# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QDNAseq
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Quantitative DNA Sequencing for Chromosomal Aberrations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-cghbase
  r-cghcall
  r-dnacopy
  r-future.apply
  r-genomicranges
  r-iranges
  r-matrixstats
  r-r.utils
  r-rsamtools
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-digest
  r-future
  r-genomeinfodb
  r-parallelly
  r-qdnaseq.hg19
  r-qdnaseq.mm10
  r-r.cache
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8ea0d0cdd52027e82bde7f54f80475ae54d45062dd746d383eca17421f36d3d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
