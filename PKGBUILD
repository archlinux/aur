# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=metadynminer3d
_pkgver=0.0.2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc="Tools to Read, Analyze and Visualize Metadynamics 3D HILLS Files from 'Plumed'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-metadynminer
  r-misc3d
  r-rcpp
  r-rgl
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55e2b7a17e08f0ebcfbb621ea0c03ebce73576c9de2409491a3be353aed32cf8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
