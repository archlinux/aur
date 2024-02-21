# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyPlot
_pkgver=1.7
pkgname=r-${_pkgname,,}
pkgver=1.7
pkgrel=1
pkgdesc='Visualising Sets of Ontological Terms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ontologyindex
  r-paintmap
  r-rgraphviz
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d508b861cfd596555f1b7bea681de71c9674fa7b708bb00b7a55744fb2cfd61b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
