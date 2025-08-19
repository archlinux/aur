# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.affymetrix
_pkgver=3.2.3
pkgname=r-${_pkgname,,}
pkgver=3.2.3
pkgrel=1
pkgdesc='Analysis of Large Affymetrix Microarray Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-aroma.apd
  r-aroma.core
  r-future
  r-listenv
  r-matrixstats
  r-r.cache
  r-r.devices
  r-r.filesets
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-affxparser
  r-affy
  r-affymetrixdatatestfiles
  r-affyplm
  r-aroma.light
  r-biobase
  r-biocgenerics
  r-dbi
  r-dchipio
  r-gcrma
  r-gsmoothr
  r-limma
  r-oligo
  r-oligoclasses
  r-pdinfobuilder
  r-preprocesscore
  r-rcolorbrewer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e117f383b1ab318dc63a10e789937c904b14f23ec8598917323a11adaa11ea1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
