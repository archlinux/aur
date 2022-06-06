# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FCBF
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
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
sha256sums=('e094a984e928f4b8e6d4d01cb7925025e5e8863fa0a265a02016b85042afd54f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
