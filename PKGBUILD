# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R4RNA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='An R package for RNA visualization and analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f706aab65e7dfa60cb55d03ebc38d41b3d43618db9f93e0b86e3ea7e0e498cc4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
