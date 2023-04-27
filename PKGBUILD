# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coMET
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='coMET: visualisation of regional epigenome-wide association scan (EWAS) results and DNA co-methylation patterns'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-corrplot
  r-genomicranges
  r-gridextra
  r-gviz
  r-hash
  r-iranges
  r-psych
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
  r-showtext
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcc770ca18f6a032358cd1e912ccbf24c3617528ad0e0acb997153097bb2ce9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
