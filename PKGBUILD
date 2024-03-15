# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smoothie
_pkgver=1.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Two-Dimensional Field Smoothing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-fields
  r-spatialvx
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55e5de4a42d4e85033840cb9734b6572')
b2sums=('f242146e75b0aefad9c3e23d79fa8ba3cce13653e21980a6ee993055e8f5f52dcb0cabb11eb16d0d6634c89c1ade33e4aa8ec567d03161942e101465b97044b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
