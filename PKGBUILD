# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=gbutils
_pkgver=0.5
pkgname=r-${_pkgname,,}
pkgver=0.5
pkgrel=1
pkgdesc='Utilities for Simulation, Plots, Quantile Functions and Programming'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rdpack
)
optdepends=(
  r-classgraph
  r-graph
  r-rgraphviz
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ae53356b4e039d937bdd66ec5dd1f061d651b574fa2671997cb0c7e26265c6be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
