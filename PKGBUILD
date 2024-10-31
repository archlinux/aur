# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FilterFFPE
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='FFPE Artificial Chimeric Read Filter for NGS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-iranges
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a796fab62a42750d4cff012fd9e0721c9f0b5f669ffebac93aa0d01b168f0a0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
