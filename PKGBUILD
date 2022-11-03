# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylSig
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='MethylSig: Differential Methylation Testing for WGBS and RRBS Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsseq
  r-delayedarray
  r-delayedmatrixstats
  r-dss
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsseqdata
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd1540e7f64e27507fd9e88aaf6dc08f574b388d36dfc8512b8bb687dfa4e9f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
