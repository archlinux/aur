# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.huge
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
pkgdesc='Methods for Accessing Huge Amounts of Data [deprecated]'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-r.methodss3
  r-r.oo
  r-r.utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05cb1edaaa0ad120c2946a80405c8c8da6a778873f08ff203391452527786ce8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
