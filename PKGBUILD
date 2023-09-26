# system requirements: librsvg2
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.5.0
pkgname=r-${_pkgname,,}
pkgver=2.5.0
pkgrel=1
pkgdesc='Render SVG Images into PDF, PNG, PostScript, or Bitmap Arrays'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  librsvg
)
optdepends=(
  r-ggplot2
  r-knitr
  r-magick
  r-rmarkdown
  r-spelling
  r-svglite
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5ddafaefe0ab8f4cb5305dcbc8a9cbafaa5210c2c51cc28480a21a2210c23be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
