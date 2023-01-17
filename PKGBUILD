# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ore
_pkgver=1.7.3.1
pkgname=r-${_pkgname,,}
pkgver=1.7.3.1
pkgrel=1
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
sha256sums=('25fd06cce08de11f8c4fb74b42f46b726210e2a4d0fb6ac86e3f360a2ec99542')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
