# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rms
_pkgver=6.5-0
pkgname=r-${_pkgname,,}
pkgver=6.5.0
pkgrel=1
pkgdesc='Regression Modeling Strategies'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-ggplot2
  r-hmisc
  r-htmltable
  r-htmltools
  r-multcomp
  r-polspline
  r-quantreg
  r-sparsem
)
optdepends=(
  r-boot
  r-knitr
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
sha256sums=('fd6f819d91d673dc40ce45126ed769d47173cda590147192fd98c2f5e45db185')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
