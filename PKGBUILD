# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneplotter
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=1.86.0
pkgrel=1
pkgdesc='Graphics related functions for Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-fibroeset
  r-hgu133a.db
  r-hgu95av2.db
  r-hu6800.db
  r-knitr
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25b55406ebf4b1ea9f0865bb6e3c2d66cf266ac7537f101de7a634208ccd488d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
