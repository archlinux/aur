# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atSNP
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Affinity test for identifying regulatory SNPs'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-biocparallel
  r-bsgenome
  r-data.table
  r-ggplot2
  r-lifecycle
  r-motifstack
  r-rappdirs
  r-rcpp
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4bca0f0a06fe4bd65106e118a13811a93776d51d906c87e44f672e2f3a24892')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
