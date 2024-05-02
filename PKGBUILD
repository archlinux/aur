# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5client
_pkgver=1.26.0
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
md5sums=('d68f63ab95a2c60c9730caea18659343')
b2sums=('dabf7f84907b761f6b4616d91091dd00b57c2e2206b25551794dff9bd1935eb4e8d4dae88ed102bab7dd1f13d55bae0e0d2054cbba1ba142de1e0737b2abbc68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
