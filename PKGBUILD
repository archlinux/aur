# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopywriteR
_pkgver=2.29.0
pkgname=r-${_pkgname,,}
pkgver=2.29.0
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
sha256sums=('46f7f6918a01b13de3f730057c19c9e9bb8594df34c5ef1399efabc665f68cc0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
