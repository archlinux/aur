# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baseline
_pkgver=1.3-5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=1
pkgdesc='Baseline Correction of Spectra'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-limsolve
  r-sparsem
)
optdepends=(
  r-gwidgets2
  r-gwidgets2tcltk
  r-idpmisc
  r-lattice
  r-mass
  r-pls
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2d58ab311f8d4b947cb19a5075ca3ff8dcdf95ebb3cb7efec31a178c7a21450')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
