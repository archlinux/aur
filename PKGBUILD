# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBImage
_pkgver=4.38.0
pkgname=r-${_pkgname,,}
pkgver=4.38.0
pkgrel=1
pkgdesc='Image processing and analysis toolbox for R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-abind
  r-biocgenerics
  r-fftwtools
  r-htmltools
  r-htmlwidgets
  r-jpeg
  r-locfit
  r-png
  r-rcurl
  r-tiff
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('510381699581592915aa5e73271f99b8ca73fe2a92fb96b86a699ac157219ded')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
