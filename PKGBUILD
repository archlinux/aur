# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spp
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=7
pkgdesc='ChIP-Seq Processing Pipeline'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-catools
  r-rcpp
  r-rsamtools
)
optdepends=(
  r-methods
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c890f3c414183167f9643b556621dcdc14ce6a1b54a04d618c74070fdebfd23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
