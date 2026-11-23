# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baseline
_pkgver=1.3-8
pkgname=r-${_pkgname,,}
pkgver=1.3.8
pkgrel=1
pkgdesc='Baseline Correction of Spectra'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sparsem
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-gwidgets2
  r-gwidgets2tcltk
  r-idpmisc
  r-lattice
  r-mass
  r-pls
  r-roxygen2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('510812d991aed0e2ff9331740776625fe423fe6309a0fc7378cc3c6c584d1947')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
