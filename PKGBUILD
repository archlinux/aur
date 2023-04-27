# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiTC
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='High Throughput Chromosome Conformation Capture analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcolorbrewer
  r-rtracklayer
)
optdepends=(
  r-biocstyle
  r-hicdatahumanimr90
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('90b7bb8bc7d41224f4b5ab9ae8eeda5736b07022af9f7410e3942ee847769a01')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
