# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LSD
_pkgver=4.1-0
pkgname=r-${_pkgname,,}
pkgver=4.1.0
pkgrel=4
pkgdesc='Lots of Superior Depictions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7553ce29985045849479f2a193cb95bda8172c9d515641e8d9c37db8186deb9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
