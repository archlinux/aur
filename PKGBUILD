# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsean
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Gene Set Enrichment Analysis with Networks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-fgsea
  r-ppinfer
)
optdepends=(
  r-annotationdbi
  r-knitr
  r-org.dm.eg.db
  r-pasilla
  r-plotly
  r-rmarkdown
  r-summarizedexperiment
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b7d6b511b4103e463382800797ce0905a894022a853148953252519ca736491')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
