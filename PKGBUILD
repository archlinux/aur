# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsean
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
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
sha256sums=('e35d30f9eaa1624ab9a4a48923b31b9d942c6e4fbdbabbd310b66f92b6dfb131')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
