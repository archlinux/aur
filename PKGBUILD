# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCX
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='R package implementing the Cytoscape Exchange (CX) format'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-igraph
  r-jsonlite
  r-plyr
)
optdepends=(
  r-base64enc
  r-biocstyle
  r-graph
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07ff5c35b7a740a46c2adcc4559804c499004f2225577abc759f60201786b92b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
