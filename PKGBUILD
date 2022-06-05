# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baseline
_pkgver=1.3-1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=4
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
sha256sums=('badea963a868e014c71a9e64185af03f5d464431218a92c16a6665083ebaf5ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
