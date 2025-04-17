# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netprioR
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('cdce3e295e1a472e06f0b78edf5adeaaf41f849957d26aa4ca6d8f42080ba244')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
