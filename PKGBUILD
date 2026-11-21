# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyFiles
_pkgver=0.9.4
pkgname=r-${_pkgname,,}
pkgver=0.9.4
pkgrel=1
pkgdesc='A Server-Side File System Viewer for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fs
  r-htmltools
  r-jsonlite
  r-shiny
  r-tibble
)
optdepends=(
  r-covr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('efcd401b1e2acea13663f48d03fbf6c61b0ca1be6ac1770bb08318b2096e2167')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
