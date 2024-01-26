# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTMLUtils
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=0.1.9
pkgrel=1
pkgdesc='Facilitates Automated HTML Report Creation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-r2html
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14e92d45743a9adf21aab726be7d1aacdc901eae443da896b149a657183a8ec4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
