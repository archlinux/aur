# Maintainer: Kristian Niemi <kristian.niemi@gmail.com>
_cranname=trackeR
_cranver=1.6.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Running, Cycling and Swimming Data from GPS-Enabled Tracking Devices"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-3.0-only')
depends=(
  r
  r-zoo
  r-ggplot2
  r-ggridges
  r-xml2
  r-rsqlite
  r-jsonlite
  r-raster
  r-scam
  r-foreach
  r-fda
  r-sp
  r-leaflet
  r-ggmap
  r-patchwork
)
optdepends=(
  r-spelling
  r-testthat
  r-knitr
  r-rmarkdown
  r-covr
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('a027243d9be4121b433ebedc50050abc090c24a0fab6ef03af9078badaeb66bc021c85e4634559141eb9128bbb6d687d58c4765cdb393773503777974b1425a5')

build() {
  mkdir -p "${srcdir}/build"
  R CMD INSTALL "${_cranname}_${_cranver}.tar.gz" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
