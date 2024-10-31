# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastseg
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='fastseg - a fast segmentation algorithm'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-dnacopy
  r-knitr
  r-oligo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ae601fefa4b3a0f9a7d8fd610b55b6209f26ad2deae28ce161ece01131b257fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
