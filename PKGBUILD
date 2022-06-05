# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.base
_pkgver=0.0-9
pkgname=r-${_pkgname,,}
pkgver=0.0.9
pkgrel=4
pkgdesc="A Lightweight Core of the 'assertive' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bf0910b0eaa507e0e11c3c43c316b524500c548d307eb045d6f89047e6ba01e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
