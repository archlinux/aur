# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=invgamma
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=4
pkgdesc='The Inverse Gamma Distribution'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aaa8de7c2a852fa6df30d8262086f6a3eb2b1fefbbc66dfe2f6c25c68917ea89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
