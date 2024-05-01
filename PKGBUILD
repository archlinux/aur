# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ternarynet
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Ternary Network Estimation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-igraph
)
optdepends=(
  r-rmpi
  r-snow
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('308c14d74262b848c8cea4807a293dd7cd979604134267fb24fc2be8e70c83b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
