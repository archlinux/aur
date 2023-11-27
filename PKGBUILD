# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMplot
_pkgver=4.5.0
pkgname=r-${_pkgname,,}
pkgver=4.5.0
pkgrel=1
pkgdesc='Circle Manhattan Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3c18a3527464d18f5c40ae2df604fd93fecc1842deb55389c09425d0abee3bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
