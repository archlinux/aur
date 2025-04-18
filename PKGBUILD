# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTNsurvival
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Survival analysis using transcriptional networks inferred by the RTN package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-dunn.test
  r-egg
  r-ggplot2
  r-pheatmap
  r-rcolorbrewer
  r-rtn
  r-rtnduals
  r-scales
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-fletcher2013b
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('642c90c75c16552a679c4bb460ba3dbb78e16c8bca12ab110efdf9371554d350')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
