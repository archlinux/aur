# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ore
_pkgver=1.7.1.1
pkgname=r-${_pkgname,,}
pkgver=1.7.1.1
pkgrel=4
pkgdesc='An R Interface to the Onigmo Regular Expression Library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-covr
  r-crayon
  r-rex
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('851323539656baca962a003b724669524145e8fab813bab42594f41060c94567')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
