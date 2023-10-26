# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsean
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Gene Set Enrichment Analysis with Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-fgsea
  r-ppinfer
)
optdepends=(
  r-knitr
  r-plotly
  r-rmarkdown
  r-summarizedexperiment
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b9b49e8f0ef56781444a117e8f02e6b93e5a01e2467d4d9a523d3f98ddcb2a97')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
