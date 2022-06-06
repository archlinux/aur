# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.0.4
pkgname=r-${_pkgname,,}
pkgver=0.0.4
pkgrel=4
pkgdesc="Supporting Functions for Packages Maintained by 'YuLab-SMU'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
optdepends=(
  r-pkgbuild
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('38850663de53a9166b8e85deb85be1ccf1a5b310bbe4355f3b8bc823ed1b49ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
