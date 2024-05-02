# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MsFeatures
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Functionality for Mass Spectrometry Features'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-mscoreutils
  r-protgenerics
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6abea027683a04f32f3ac6f8dc34f204a90238f035ea8bd048463245772136df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
