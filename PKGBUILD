# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopywriteR
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='Copy number information from targeted sequencing using off-target reads'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-chipseq
  r-copyhelper
  r-data.table
  r-dnacopy
  r-futile.logger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gtools
  r-iranges
  r-matrixstats
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-sclcbam
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab03a36302d61d4d46ddee175c576867d51fbf63c98a0fc379179a54d59e21cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
