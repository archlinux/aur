# system requirements: Java (>= 1.6)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=paxtoolsr
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Access Pathways from Multiple Databases Through BioPAX and Pathway Commons'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-httr
  r-igraph
  r-jsonlite
  r-plyr
  r-r.utils
  r-rappdirs
  r-readr
  r-rjava
  r-rjson
  r-xml
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-dosnow
  r-foreach
  r-formatr
  r-knitr
  r-org.hs.eg.db
  r-parallel
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a9f5b4a4a8d35078c9dbdb84f2969230e5df78e16547d7746a7b2d095102bf71')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
