# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kissDE
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('a93b44ad0b146cbfae3e8d9cbaee4a5bf18199c87f6002938c1a9e4123d4009c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
