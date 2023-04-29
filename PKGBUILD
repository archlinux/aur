# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coexnet
_pkgver=1.19.1
pkgname=r-${_pkgname,,}
pkgver=1.19.1
pkgrel=4
pkgdesc='coexnet: An R package to build CO-EXpression NETworks from Microarray Data'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-acde
  r-affy
  r-biobase
  r-geoquery
  r-igraph
  r-limma
  r-minet
  r-rmarkdown
  r-siggenes
  r-stringdb
  r-summarizedexperiment
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
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
