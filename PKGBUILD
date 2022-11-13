# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRspongeR
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Identification and analysis of miRNA sponge interaction networks and modules'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterprofiler
  r-corpcor
  r-doparallel
  r-dose
  r-foreach
  r-igraph
  r-linkcomm
  r-mcl
  r-org.hs.eg.db
  r-rcpp
  r-reactomepa
  r-sponge
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('734c21b17c2001873191245f319ea6d555c1874927afb105cbbf137af9ffa45a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
