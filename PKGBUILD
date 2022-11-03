# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FCBF
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc='Fast Correlation Based Filter for Feature Selection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-gridextra
  r-mclust
  r-pbapply
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-caret
  r-knitr
  r-mlbench
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27c11be85846f6b7d78afe9591066f1c96373b91907df763f67076147a118c88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
