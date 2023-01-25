# system requirements: Gnu Scientific Library version >= 2.1
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsl
_pkgver=2.1-8
pkgname=r-${_pkgname,,}
pkgver=2.1.8
pkgrel=1
pkgdesc='Wrapper for the Gnu Scientific Library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  gsl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f33609bf485abd190e65ff5d0fdab438b759294c47b921d983d89d6f053a2d95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
