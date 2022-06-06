# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tensor
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=4
pkgdesc='Tensor product of arrays'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e1dec23e3913a82e2c79e76313911db9050fb82711a0da227f94fc6df2d3aea6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
