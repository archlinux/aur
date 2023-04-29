# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEComplexDisease
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=4
pkgdesc='A tool for differential expression analysis and DEGs based investigation to complex diseases by bi-clustering analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-complexheatmap
  r-deseq2
  r-edger
  r-rcpp
  r-summarizedexperiment
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('90a6c072e14b73b3a9066d6b6445618f79d8b7f1ea3f214381d1f3f6c04afc89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
