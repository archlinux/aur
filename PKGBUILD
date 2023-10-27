# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiTC
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
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
sha256sums=('009d583930635dc2faaa41769fd1dd5655628aeb9e9a9d681eb4a7ea92c05b9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
