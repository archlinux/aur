# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepStat
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Statistical analysis of peptide microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-data.table
  r-fields
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-plyr
)
optdepends=(
  r-knitr
  r-pepdat
  r-pviz
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6301ddfc629d761f6d57200c108171b78b176abdcc82898fa6a7f61f8c1543ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
