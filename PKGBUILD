# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinycssloaders
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=1
pkgdesc="Add Loading Animations to a 'shiny' Output While It's Recalculating"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-digest
  r-glue
  r-shiny
)
optdepends=(
  r-shinydisconnect
  r-shinyjs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('038ad76024e6b38dcc9bbe22aa07a58034bc8410ad25329bdc4db42203e2ef70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
