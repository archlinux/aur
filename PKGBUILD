# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baseline
_pkgver=1.3-4
pkgname=r-${_pkgname,,}
pkgver=1.3.4
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
sha256sums=('ddfbf1a19c6ff1c81cf856987609359e585e7ddeb9abe1e538ed8be8f74786ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
