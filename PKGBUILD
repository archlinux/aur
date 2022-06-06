# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phastCons100way.UCSC.hg19
_pkgver=3.7.2
pkgname=r-${_pkgname,,}
pkgver=3.7.2
pkgrel=3
pkgdesc='UCSC phastCons conservation scores for hg19'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-genomicscores
  r-iranges
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca052a0f6e874bcc8079b29e3cc1a29cb6b852b32d5a7a45dea5cff7c924acca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
