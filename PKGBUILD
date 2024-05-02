# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tigre
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Transcription factor Inference through Gaussian process Reconstruction of Expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-gplots
  r-rsqlite
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-drosgenome1.db
  r-lumi
  r-puma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9d3f4abdbf2239125f9366cca8e1a7b93919e4a45621b951d6ed937ad48baebd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
