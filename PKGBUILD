# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsean
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('66decb814fb65df2d5257e087679f752630cd0316ae47a1082d35f1063491d59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
