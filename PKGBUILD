# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome.Hsapiens.UCSC.hg19
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
pkgrel=4
pkgdesc='Full genome sequences for Homo sapiens (UCSC version hg19, based on GRCh37.p13)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5bfa65d7836449d9b30c356968497cdfaa98be48c4e329e71e8f8a120f3e9d1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
