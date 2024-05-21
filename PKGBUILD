# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=googleway
_cranver=2.7.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides a mechanism to plot a 'Google Map' from 'R' and overlay it with shapes and markers. Also provides access to 'Google Maps' APIs, including places, directions, roads, distances, geocoding, elevation and timezone."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-jsonlite
    r-curl
    r-htmlwidgets
    r-htmltools
    r-magrittr
    r-shiny
    r-jpeg
    r-utils
    r-jqr
    r-viridislite
    r-scales
    r-grdevices
    r-googlepolylines
)
makedepends=()
optdepends=(
    r-knitr
    r-markdown
    r-testthat
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('80566b03823e4e3431c18a395f146bcb7e5e61d4ec960a7d5407d0ad3c84b19e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
