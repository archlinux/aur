# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=marima
_pkgver=2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Multivariate ARIMA and ARIMA-X Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d4ed509e53612f09c04da251444481b1')
b2sums=('6de2b81e045d2e9cfd68051265688e886a01040182440bcd06cf770cbf4a778348324b562249c29108ad9e7a708dbbb5a514d4ed7b5e6215938a0d2dccac1516')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
