# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isva
_pkgver=1.10
pkgname=r-${_pkgname,,}
pkgver=1.10
pkgrel=1
pkgdesc='Independent Surrogate Variable Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastica
  r-jade
  r-qvalue
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f44aaf11e38088a20d607c6137f41189ef85baf82073ce17a90851e3165fa1c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
