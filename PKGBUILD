# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deconstructSigs
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=3
pkgdesc='Identifies Signatures Present in a Tumor Sample'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomeinfodb
  r-reshape2
)
optdepends=(
  r-variantannotation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ab8f6c0fd674bd270035ba2112f1a79d63de1155ba9698c4169c92196059d04')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
