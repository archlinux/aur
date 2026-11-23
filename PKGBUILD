# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=capushe
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data-Driven Slope Estimation and Dimension Jump"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b752f5debc0660b423bc812d6a9deb56')
b2sums=('11f39a0687d9a6dae295f5fc37c5a4ab6216f221a3cb79fe48290e431e2f4741fc4a81fb035ecabdf095f930e35014e980d8cfd422d271d84cfe52f8b31e0ca1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
