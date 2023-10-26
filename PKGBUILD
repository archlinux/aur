# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEDME
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Modelling Experimental Data from MeDIP Enrichment'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-drc
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
  r-bsgenome.mmusculus.ucsc.mm9
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('505e7cb16c95d825bae0f69d781dfee8f87885ec4c2449c1c2e2bb7abacbde05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
