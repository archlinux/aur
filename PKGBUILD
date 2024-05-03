# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BubbleTree
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=2.34.0
pkgrel=1
pkgdesc='BubbleTree: an intuitive visualization to elucidate tumoral aneuploidy and clonality in somatic mosaicism using next generation sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocstyle
  r-biovizbase
  r-dplyr
  r-e1071
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtable
  r-gtools
  r-iranges
  r-limma
  r-magrittr
  r-plyr
  r-rcolorbrewer
  r-writexls
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a415bdd0ee4ca905ba88f7805b38aa9d18e0c079b4dbe656c39ea96628c2c950')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
