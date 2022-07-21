# system requirements: PhantomJS (http://phantomjs.org) for takingscreenshots, ImageMagick (http://www.imagemagick.org) orGraphicsMagick (http://www.graphicsmagick.org) and OptiPNG(http://optipng.sourceforge.net) for manipulating images.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=webshot
_pkgver=0.5.3
pkgname=r-${_pkgname,,}
pkgver=0.5.3
pkgrel=3
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
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7c4f2be61c8c4730202a9c3604072478e30cb85b423b7497cd703cc3f49dbc0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
