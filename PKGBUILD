# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ore
_pkgver=1.7.2.1
pkgname=r-${_pkgname,,}
pkgver=1.7.2.1
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
sha256sums=('efc9850da514c79d69eec6fb3df1169a6302dbbbbc79e828d28b849eba018580')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
