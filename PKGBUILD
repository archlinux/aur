# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5client
_pkgver=1.30.1
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
md5sums=('744c6bcdd64d6661f105b91dfcad8b9c')
b2sums=('d1bdf8cd250f8e465ff5e7febb7b88233e0aa83cba584cfddf9d0d07d7a33c078312a7f98c77d3217963e537a153079a085540960dbc8913365bacb8cb91c868')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
