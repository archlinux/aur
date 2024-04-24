# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beanplot
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Visualization via Beanplots (Like Boxplot/Stripchart/Violin Plot)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-vioplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64bf7f77c3c50703f0842e78dd56ef69')
b2sums=('212e72add89361e188d08c169511ae62d5a9b00c56feddf4c6c25f18404f49371144b9c08b60c7efdb7b424821ccce08fb2fbb815d7dd26144cf2425b1544052')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
