# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=les
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Identifying Differential Effects in Tiling Microarray Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fdrtool
  r-gplots
  r-rcolorbrewer
)
optdepends=(
  r-biobase
  r-limma
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cea216c1f610b6cd3484f75912fdcc237a7ab652ae66d61d8044ef13129820c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
