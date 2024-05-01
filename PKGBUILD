# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgga
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Hierarchical ensemble method based on factor graph'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-curl
  r-e1071
  r-graph
  r-grbase
  r-jsonlite
  r-rbgl
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-go.db
  r-gostats
  r-knitr
  r-proc
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9214af5aea7e198bf899bc1f92bbfdc32f2ee70f0a5439c36a6fd2671707ba1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
