# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tseriesChaos
_pkgver=0.1-13.1
pkgname=r-${_pkgname,,}
pkgver=0.1.13.1
pkgrel=1
pkgdesc='Analysis of Nonlinear Time Series'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-desolve
)
optdepends=(
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('23cb5fea56409a305e02a523ff8b7642ec383942d415c9cffdc92208dacfd961')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
