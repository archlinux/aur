# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyMatrix
_pkgver=0.8.1
pkgname=r-${_pkgname,,}
pkgver=0.8.1
pkgrel=1
pkgdesc='Shiny Matrix Input Field'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-jsonlite
  r-shiny
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f66b990fa2804c1b528e5345128949ebeb7af3f743a81955e86db60395f187ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
