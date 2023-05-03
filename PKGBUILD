# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=survey
_pkgver=4.2-1
pkgname=r-${_pkgname,,}
pkgver=4.2.1
pkgrel=1
pkgdesc='Analysis of Complex Survey Samples'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-minqa
  r-mitools
  r-numderiv
)
optdepends=(
  r-aer
  r-compquadform
  r-dbi
  r-foreign
  r-hexbin
  r-kernsmooth
  r-mass
  r-parallel
  r-quantreg
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc3c61e132fb20bed98fa59a8254335a588780a5f4eeb51fab7489390aadf150')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
