# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMplot
_pkgver=4.4.1
pkgname=r-${_pkgname,,}
pkgver=4.4.1
pkgrel=1
pkgdesc='Circle Manhattan Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7543b1047bd3bb7d4bea2baa40315346903e6e0438da4b0154445f79d6d0cef8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
