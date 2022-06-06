# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapsis
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='An R package to automate the analysis of double-strand break repair during meiosis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ebimage
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5ef2a5d2958353d6e54360527f3df872bde68382ebfa0b081ff76a4445d112d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
