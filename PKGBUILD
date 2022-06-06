# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kableExtra
_pkgver=1.3.4
pkgname=r-${_pkgname,,}
pkgver=1.3.4
pkgrel=4
pkgdesc="Construct Complex Table with 'kable' and Pipe Syntax"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-digest
  r-glue
  r-htmltools
  r-knitr
  r-magrittr
  r-rmarkdown
  r-rstudioapi
  r-rvest
  r-scales
  r-stringr
  r-svglite
  r-viridislite
  r-webshot
  r-xml2
)
optdepends=(
  r-formattable
  r-magick
  r-sparkline
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('091ffac282cf9257edcec1a06da38b5e6516f111296bedb934e32f5692ffbbb0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
