# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsean
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('dc08987866bffc6059bb4babce2563e28336a9088117eccd354ec31c070141aa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
