# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeAndLeaf
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Displaying binary trees with focus on dendrogram leaves'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-igraph
  r-reder
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dendextend
  r-dplyr
  r-geneplast
  r-ggplot2
  r-ggtree
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5890d6a789bad58eef8cc9e9417efcf07c0ec1dc8364fe9a49e2cec21cb31e45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
