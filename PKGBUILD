# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNViz
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Copy Number Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-copynumberplots
  r-dplyr
  r-dt
  r-genomicranges
  r-karyoploter
  r-magrittr
  r-plotly
  r-scales
  r-shiny
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b2eb31e6d7288d72f0ecd525c25a7c37b8baa293ea46fce3e2ba5443345f2e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
