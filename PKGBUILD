# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENCODExplorer
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=2.20.0
pkgrel=6
pkgdesc='A compilation of ENCODE metadata'
arch=('any')
url="https://bioconductor.org/packages/3.14/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-jsonlite
  r-rcurl
  r-tidyr
  r-data.table
  r-dplyr
  r-stringr
  r-stringi
  r-annotationhub
  r-genomicranges
  r-rtracklayer
  r-s4vectors
  r-genomeinfodb
  r-encodexplorerdata
)
makedepends=(
  git
  tar
)
optdepends=(
    r-runit
    r-biocgenerics
    r-knitr
    r-curl
    r-httr
    r-shiny
    r-shinythemes
    r-dt
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

