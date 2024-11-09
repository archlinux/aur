# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBGNview
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='"SBGNview: Data Analysis, Integration and Visualization on SBGN Pathways"'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-annotationdbi
  r-bookdown
  r-httr
  r-igraph
  r-keggrest
  r-knitr
  r-pathview
  r-rdpack
  r-rmarkdown
  r-rsvg
  r-sbgnview.data
  r-summarizedexperiment
  r-xml2
)
optdepends=(
  r-gage
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('568065f4da435dfe2318fb645b7871b0c2c05e1da270205cbf9d62faae2d8615')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
