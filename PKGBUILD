# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome.Hsapiens.UCSC.hg38
_pkgver=1.4.5
pkgname=r-${_pkgname,,}
pkgver=1.4.5
pkgrel=1
pkgdesc='Full genome sequences for Homo sapiens (UCSC version hg38, based on GRCh38.p13)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b49277e4fd955be76571f187630993b02a459c7c5b69ef62a01a75dd5226e952')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
