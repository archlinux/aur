# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PING
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
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
sha256sums=('e25f17ab09bb42684accf4db0de91cb4b3f7d6723812ca6f1987ea14da88a13d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
