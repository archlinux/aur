# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylSig
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('28a0f2a62dfa3f32db3cc7284043021a5e3dbedb25ee46f2c70c1c3409aaf6cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
