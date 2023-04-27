# system requirements: Cytoscape (>= 3.7.1), CyREST (>= 3.8.0)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCy3
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=2.20.0
pkgrel=1
pkgdesc='Functions to Access and Control Cytoscape'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-base64enc
  r-base64url
  r-biocgenerics
  r-fs
  r-glue
  r-gplots
  r-graph
  r-httr
  r-irdisplay
  r-irkernel
  r-rcolorbrewer
  r-rcurl
  r-rjsonio
  r-uchardet
  r-uuid
  r-xml
)
optdepends=(
  r-biocstyle
  r-grdevices
  r-igraph
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c2774da9caf6e01b155e8ee9e69ea57884614c658a370d537537c1bcf06f358')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
