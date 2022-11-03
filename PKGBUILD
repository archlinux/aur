# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEComplexDisease
_pkgver=1.17.1
pkgname=r-${_pkgname,,}
pkgver=1.17.1
pkgrel=1
pkgdesc='A tool for differential expression analysis and DEGs based investigation to complex diseases by bi-clustering analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bee5373022f894a939a3b6fe086671cf7272a87265a21fe6a73a60e5ec79b60e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
