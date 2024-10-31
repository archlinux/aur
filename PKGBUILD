# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interacCircos
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='The Generation of Interactive Circos Plot'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-htmlwidgets
  r-plyr
  r-rcolorbrewer
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0501f16403d3887f10eecf4074293f4944b7cbff255b0e3a7451cb0b2a526a29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
