# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowViz
_pkgver=1.76.1
pkgname=r-${_pkgname,,}
pkgver=1.76.1
pkgrel=1
pkgdesc='Visualization for flow cytometry'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-flowcore
  r-hexbin
  r-idpmisc
  r-latticeextra
  r-rcolorbrewer
)
optdepends=(
  r-colorspace
  r-flowstats
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('668ff68d319479448c1edeafbb21e7b4c56c43cda7825be87fa2f11cc58c704c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
