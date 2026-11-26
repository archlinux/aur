# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5client
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access HDF5 content from HDF Scalable Data Service"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-delayedarray
  r-httr
  r-rjson
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0595dfd8a41d5e965100698e76cfdef9')
b2sums=('70eab1d23c26e9fb1e22a9199e04bd797b0aa5f871d0577854befa0af4c1f934fb9bce218eb833c874c06b0c6af371b76112a70088ea0bb9b029a6d751aef400')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
