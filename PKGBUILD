# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
pkgrel=1
pkgdesc='genefilter: methods for filtering genes from high-throughput experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-matrixgenerics
)
optdepends=(
  r-all
  r-biocstyle
  r-class
  r-hgu95av2.db
  r-knitr
  r-rcolorbrewer
  r-roc
  r-tkwidgets
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('276a21419d8ff698fa0f26dcc872fb7f81068e46e7c790eb515ae73f3b1e82f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
