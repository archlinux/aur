# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rms
_pkgver=6.6-0
pkgname=r-${_pkgname,,}
pkgver=6.6.0
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
  r-kableextra
  r-knitr
  r-multcomp
  r-polspline
  r-quantreg
  r-sparsem
)
optdepends=(
  r-boot
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
sha256sums=('f3abadb94339f3aedadd27e1aceade069bcb53c94bf246626b0dc94b16b6625c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
