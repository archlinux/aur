# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomvRCNS
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Copy Number study and Segmentation for multivariate biological data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-gviz
  r-iranges
  r-mvtnorm
)
optdepends=(
  r-cluster
  r-dynamictreecut
  r-genomicfeatures
  r-parallel
  r-rsamtools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('562375dcfebebf2b6219fbcd5063b1e5d37d34c6d1eb1b2d9b052a42ce320258')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
