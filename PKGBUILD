# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rms
_pkgver=6.8-2
pkgname=r-${_pkgname,,}
pkgver=6.8.2
pkgrel=1
pkgdesc='Regression Modeling Strategies'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-digest
  r-ggplot2
  r-hmisc
  r-htmltable
  r-htmltools
  r-knitr
  r-multcomp
  r-polspline
  r-quantreg
  r-sparsem
)
optdepends=(
  r-boot
  r-kableextra
  r-lattice
  r-mice
  r-nnet
  r-plotly
  r-rmsb
  r-tcltk
  r-vgam
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83e7ca712e9b7b6860f137abda1d4a1d58688e697983980b93e5edbf7adbe47f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
