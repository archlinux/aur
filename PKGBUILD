# system requirements: Rtools (>= 3.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromDraw
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='chromDraw is a R package for drawing the schemes of karyotypes in the linear and circular fashion.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-rcpp
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('377131cfad61a53b0a4cb27b2d3061ea5c1b7af7f9ed9756984ce7bd0af59e84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
