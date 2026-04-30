# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netprioR
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='A model for network-based prioritisation of genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dplyr
  r-foreach
  r-ggplot2
  r-gridextra
  r-proc
  r-sparsemvn
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pander
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fba54ace176c4964acf40afa6964bb2d7d23191b79f897165fe573ea5738583')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
