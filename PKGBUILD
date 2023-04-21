# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMplot
_pkgver=4.3.1
pkgname=r-${_pkgname,,}
pkgver=4.3.1
pkgrel=1
pkgdesc='Circle Manhattan Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df2a5b814da248387f442c0ab81128c9e355637b0009ffe0e9ef3fab4b8dbb95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
