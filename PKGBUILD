# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Repitools
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Epigenomic tools'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-dnacopy
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gplots
  r-gsmoothr
  r-iranges
  r-ringo
  r-rsamtools
  r-rsolnp
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
  r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0af0fc2131a0e27448ec71ef75ba6716c94e3d74dca501dacd09c9adf2d725e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
