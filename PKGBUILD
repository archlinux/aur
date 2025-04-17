# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowViz
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
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
sha256sums=('b2c22ba58f6f49c3c985af0ecc5fe9e598af3fd6af05c4af10c67c55c32db68c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
