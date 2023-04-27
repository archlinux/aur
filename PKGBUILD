# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kissDE
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Retrieves Condition-Specific Variants in RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-aods3
  r-biobase
  r-deseq2
  r-doparallel
  r-dss
  r-dt
  r-factoextra
  r-foreach
  r-ggplot2
  r-gplots
  r-matrixstats
  r-shiny
  r-shinycssloaders
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2b80fc722d2a1578c807dcfebce22b878fa4bb2a55d06757f7b2a2cb46e32b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
