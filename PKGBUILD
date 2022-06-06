# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VennDiagram
_pkgver=1.7.3
pkgname=r-${_pkgname,,}
pkgver=1.7.3
pkgrel=3
pkgdesc='Generate High-Resolution Venn and Euler Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-futile.logger
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e7c2475f7613241787e6c85bd03315e4fd88413ccbbb735959756a8c2eeb8c46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
