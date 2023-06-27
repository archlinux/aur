# system requirements: PhantomJS (http://phantomjs.org) for takingscreenshots, ImageMagick (http://www.imagemagick.org) orGraphicsMagick (http://www.graphicsmagick.org) and OptiPNG(http://optipng.sourceforge.net) for manipulating images.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=webshot
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=0.5.5
pkgrel=1
pkgdesc='Take Screenshots of Web Pages'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-callr
  r-jsonlite
  r-magrittr
)
optdepends=(
  r-httpuv
  r-knitr
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d675913ccac80e0af8ee396f95a24124eae6c42d80aed9f47f7a88218ecbb913')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
