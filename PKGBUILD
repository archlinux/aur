# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pipeFrame
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Pipeline framework for bioinformatics in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-digest
  r-genomeinfodb
  r-magrittr
  r-rmarkdown
  r-visnetwork
)
optdepends=(
  r-biocmanager
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f55868ec5f7722856891a91f05c2f82755c392a5eea884f1337cb9cab5f69361')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
