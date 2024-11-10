# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cleanUpdTSeq
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc="cleanUpdTSeq cleans up artifacts from polyadenylation sites from oligo(dT)-mediated 3' end RNA sequending data"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-bsgenome.drerio.ucsc.danrer7
  r-e1071
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
  r-seqinr
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9364088a2f5e752086488ee7fed879da6383ea8d530cfea7f76388f45b871376')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
