# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maptree
_pkgver=1.4-8
pkgname=r-${_pkgname,,}
pkgver=1.4.8
pkgrel=3
pkgdesc='Mapping, pruning, and graphing tree models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55cf12af55540e7d53c8a7ae4bf87e192f5dec4161b3cdf2146689e8c8b465f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
