# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coMET
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='coMET: visualisation of regional epigenome-wide association scan (EWAS) results and DNA co-methylation patterns'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-colortools
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cab1d8aca47736440f3d36a4150f08c6d3073524bc4e77618a55217df44b3945')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
