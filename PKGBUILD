# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epivizrStandalone
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Run Epiviz Interactive Genomic Data Visualization App within R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-epivizr
  r-epivizrserver
  r-genomeinfodb
  r-genomicfeatures
  r-git2r
  r-s4vectors
)
optdepends=(
  r-biobase
  r-biocstyle
  r-knitr
  r-mus.musculus
  r-organismdbi
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0398b1e4230bd9325fdc86111b9a40ab8f82b650074c4cb7eb84fe50f1e06e04')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
