# system requirements: ImageMagick
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowcatchR
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('44fdf393e271960ad2c043bd28fc7a5657733ee548e557081bcf4f08783f3219')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
