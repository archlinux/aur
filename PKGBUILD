# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pipeFrame
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-knitr
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de89d975a15d9e81f8c2a377420571c817f6599b91f55bec9fc71d25cf9cbd8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
