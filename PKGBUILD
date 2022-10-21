# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatLT
_pkgver=0.3.26
pkgname=r-${_pkgname,,}
pkgver=0.3.26
pkgrel=1
pkgdesc='Analysis of Animal Movements'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-adehabitatma
  r-circstats
  r-sp
)
optdepends=(
  r-maptools
  r-mass
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40bb64f343a350364b5ae8af521810fc9607271b04690980f6c8660150c40808')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
