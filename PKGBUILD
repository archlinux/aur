# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertCurve
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Making 2D Hilbert Curve'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-circlize
  r-genomicranges
  r-hilbertvis
  r-iranges
  r-png
  r-polylabelr
)
optdepends=(
  r-complexheatmap
  r-getoptlong
  r-knitr
  r-markdown
  r-rcolorbrewer
  r-rcurl
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8a23721389fc2d1bd308316740aba1ae546733a3a47c3ecb9f61305c92ea710')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
