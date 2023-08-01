# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densvis
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=1.10.3
pkgrel=1
pkgdesc='Density-Preserving Data Visualization via Non-Linear Dimensionality Reduction'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-basilisk
  r-rcpp
  r-reticulate
  r-irlba
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-rtsne
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e9aab046eefe33e65cb1edb85f94ce94b6f32fff14c93c2a4e3f11b9048871da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
