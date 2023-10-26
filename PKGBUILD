# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netprioR
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('913b56763c125c2729a51c0a550b5533ad511a4bdd310f9ff4c52f7abb4c0b0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
