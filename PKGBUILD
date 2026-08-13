# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MLSeq
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='Machine Learning Interface for RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-caret
  r-deseq2
  r-edger
  r-foreach
  r-ggplot2
  r-limma
  r-pamr
  r-plyr
  r-sseq
  r-summarizedexperiment
  r-testthat
  r-venndiagram
  r-xtable
)
optdepends=(
  r-e1071
  r-kernlab
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7618e9f4e6cfba7bd3673a8924d594a1cf13249cb820061e0f38f83fab31161a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
