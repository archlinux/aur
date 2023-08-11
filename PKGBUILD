# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPMG
_pkgver=2.2-6
pkgname=r-${_pkgname,,}
pkgver=2.2.6
pkgrel=1
pkgdesc='Graphical User Interface (GUI) for Interactive R Analysis Sessions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1650e3a90b6c3b8e0023b11791bfb446d39d6e10408a1e0216951d36754ac319')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
