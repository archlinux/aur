# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowViz
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
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
sha256sums=('0efd9db768ea51a4137b0991fe6f83a6f25413d23d4275d1aa069b9d997dbe9c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
