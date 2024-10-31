# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=triplex
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
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
sha256sums=('0f842e3b7fde5517e31265529ca3075698b37d4da80f5f62ec5ad7322ffbadcb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
