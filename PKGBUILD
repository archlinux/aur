# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggupset
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=5
pkgdesc="Combination Matrix Axis for 'ggplot2' to Create 'UpSet' Plots"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gtable
  r-rlang
  r-scales
  r-tibble
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e87a0a2052a148f466e6eae7da969332a36cfe73724e90329f77de08181c7322')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
