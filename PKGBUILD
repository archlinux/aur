# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=slinky
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=5
pkgdesc='Putting the fun in LINCS L1000 data analysis'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/slinky.html"
license=('MIT')
depends=(
  r
  r-curl
  r-dplyr
  r-foreach
  r-httr
  r-jsonlite
  r-readr
  r-rhdf5
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biobase
  r-biocstyle
  r-doparallel
  r-geode
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b6c1d58e4655744e2ba5f8422c4b2c95f184cd3e1c3a5e0fa568eef77f3dc17')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
