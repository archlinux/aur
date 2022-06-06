# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PING
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='Probabilistic inference for Nucleosome Positioning with MNase-based or Sonicated Short-read Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-fda
  r-genomicranges
  r-gviz
  r-iranges
  r-pics
  r-s4vectors
)
optdepends=(
  r-parallel
  r-rtracklayer
  r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b4a538ac49db798d478e6513983b2f2162a3993846ef9357bbb7b81711a6e574')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
