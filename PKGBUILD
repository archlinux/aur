# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGenomeTracksData
_pkgver=0.99.0
pkgname=r-${_pkgname,,}
pkgver=0.99.0
pkgrel=4
pkgdesc='Demonstration Data from rGenomeTracks Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
)
optdepends=(
  r-biocmanager
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a0a73f0a24c8ae370d8e0ce8d564148d16072fea7c23f75b666819500412fad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
