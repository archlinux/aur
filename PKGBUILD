# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stable
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Probability Functions and Generalized Regression Models for Stable Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rmutil
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('903aeec422f3f8ecdbb33963606767cd')
b2sums=('5a560222f79b545b37ad806789284fff0063239a7467404c616a21b3e4a05cebc030a51425e8e28fc6040b023a8f8029c99333ebf6be2e8f4273503914340e84')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
