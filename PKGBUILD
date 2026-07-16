# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PAST
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Pathway Association Study Tool (PAST)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dplyr
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iterators
  r-qvalue
  r-rlang
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52baf50cfbcd923c0a2a3d41d78a3a3f21e51c7b3dcd5f6dc8542cd3034ed1f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
