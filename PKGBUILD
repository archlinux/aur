# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweedie
_pkgver=3.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Evaluation of Tweedie Exponential Family Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lifecycle
  r-statmod
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ee30e698ec0fa56c767accc87d964e0f')
b2sums=('507bcc25ba3ba0cfc18a6733c44b2eeb786a9175d9670d272d72902fa29631b10e36038f85beca3c2773b1c0d9f89456ba9e99bcbfeb2869711e744d925fbbba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
