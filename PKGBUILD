# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiHiCcompare
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Normalize and detect differences between Hi-C datasets when replicates of each experimental condition are available'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-aggregation
  r-biocparallel
  r-data.table
  r-dplyr
  r-edger
  r-genomeinfodb
  r-genomeinfodbdata
  r-genomicranges
  r-hiccompare
  r-pbapply
  r-pheatmap
  r-qqman
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('224c2bc3b30413f0d76cab0eb88f6f4ced6bbe6f60373b43bd0ff88e9547ab40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
