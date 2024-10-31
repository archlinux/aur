# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OnassisJavaLibs
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run conceptmapper and semantic similarity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ae799e8406dddd107fd8f762d95fa3f')
b2sums=('d7ab63491e908ac8b92045ef138bfda0f424425968d900e39657cebfad53d68b252dcbc600ef94c96040bc4446b76fad892517ccd5a75d2bcd20809954eae8a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
