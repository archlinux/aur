# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atSNP
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('df341d890ed1928abae8a20f8527d7ecd4c3f160dcd2fd3ffe1cf988b45fec22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
