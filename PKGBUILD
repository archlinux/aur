# system requirements: Poppler C++ API: libpoppler-cpp-dev (deb) orpoppler-cpp-devel (rpm). The unit tests also require the'poppler-data' package (rpm/deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdftools
_pkgver=3.3.2
pkgname=r-${_pkgname,,}
pkgver=3.3.2
pkgrel=3
pkgdesc='Text Extraction, Rendering and Converting of PDF Documents'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-qpdf
  r-rcpp
  poppler
)
optdepends=(
  r-png
  r-tesseract
  r-testthat
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('451f4ad7699d482eaf847684ea0f384049cbb3b7a22ff89a02b30e091f4a5a04')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
