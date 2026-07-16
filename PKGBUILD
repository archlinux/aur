# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QDNAseq
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('da1ae7f633e2d48f61e62977b56916d219e90fde00fcfe0445b0dfec20974096')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
