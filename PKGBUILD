# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chipseq
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='chipseq: A package for analyzing chipseq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-s4vectors
  r-shortread
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-bsgenome.mmusculus.ucsc.mm9
  r-genomicfeatures
  r-knitr
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d137f756788c6c3d00794d5e5090d078dcc5fa4f05ca446e6d5c124a6d4f89bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
