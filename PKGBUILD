# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Hmisc
_pkgver=5.0-0
pkgname=r-${_pkgname,,}
pkgver=5.0.0
pkgrel=1
pkgdesc='Harrell Miscellaneous'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-colorspace
  r-data.table
  r-formula
  r-ggplot2
  r-gridextra
  r-gtable
  r-htmltable
  r-htmltools
  r-latticeextra
  r-viridis
)
optdepends=(
  r-acepack
  r-chron
  r-knitr
  r-mice
  r-plotly
  r-plyr
  r-rlang
  r-rms
  r-rstudioapi
  r-tables
  r-vgam
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3f71506394de7df970aec092fc25f44c9e2ba1a2bb56a1e5954d377b4245da4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
