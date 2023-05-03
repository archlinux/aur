# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LEA
_pkgver=3.12.2
pkgname=r-${_pkgname,,}
pkgver=3.12.2
pkgrel=1
pkgdesc='LEA: an R package for Landscape and Ecological Association Studies'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a93ac595bdcae577d93a2efd6402baaba387f423fa21ae7fbd51c17e11cdb9cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
