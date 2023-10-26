# system requirements: ImageMagick
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowcatchR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Tools to analyze in vivo microscopy imaging data focused on tracking flowing blood cells'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-abind
  r-biocparallel
  r-colorramps
  r-ebimage
  r-plotly
  r-shiny
  imagemagick
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6579e5baa75944b20b4ca2e8e0a78ebc3c14b3feefed944b1119450585ce47a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
