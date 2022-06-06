# system requirements: Poppler C++ API: libpoppler-cpp-dev (deb) orpoppler-cpp-devel (rpm). The unit tests also require the'poppler-data' package (rpm/deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdftools
_pkgver=3.2.1
pkgname=r-${_pkgname,,}
pkgver=3.2.1
pkgrel=1
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
  r-jpeg
  r-png
  r-tesseract
  r-testthat
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1e18f7c9366e7613f61c0266c584412c8e448cfc1f71101b5c8d1dd6cbb37ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
