# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CountClust
_pkgver=1.23.1
pkgname=r-${_pkgname,,}
pkgver=1.23.1
pkgrel=4
pkgdesc='Clustering and Visualizing RNA-Seq Expression Data using Grade of Membership Models'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-flexmix
  r-ggplot2
  r-gtools
  r-limma
  r-maptpx
  r-picante
  r-plyr
  r-reshape2
  r-slam
  r-squarem
)
optdepends=(
  r-biobase
  r-biocstyle
  r-devtools
  r-kableextra
  r-knitr
  r-rcolorbrewer
  r-roxygen2
  r-xtable
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
