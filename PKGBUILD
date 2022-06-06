# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=triplex
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Search and visualize intramolecular triplex-forming sequences in DNA'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-genomicranges
  r-iranges
  r-s4vectors
  r-xvector
)
optdepends=(
  r-bsgenome.celegans.ucsc.ce10
  r-rgl
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08bf4e0c1ddb048cf356037133fe86072c9919e23adfdc360c82efbc37a8ce1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
