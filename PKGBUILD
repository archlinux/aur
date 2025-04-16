# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Reporting
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Reporting Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-xtable
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83485543eda6c73a17ab201713e97e63')
b2sums=('d20b0adfa47a2ed4cb1870831fda841004a42364232ee3581e1000cd73b541eb3419e3d0bbd1c2c52c9aade29a404bd015e12caac38d44060e27883ad6b8bb9d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
