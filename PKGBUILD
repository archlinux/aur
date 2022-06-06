# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=filematrix
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=4
pkgdesc='File-Backed Matrix Class with Convenient Read and Write Access'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bf0c29bcab0d1bec7d80253899cc41581b2f0d2d236a7c1d25590f36c906aec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
