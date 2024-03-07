# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sonicLength
_pkgver=1.4.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Estimating Abundance of Clones from DNA Fragmentation Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f2ba331f3e7c0368220ec0c463d6838f')
b2sums=('52b663daec95952304878535cf4b4e3c9ed3162b12ef051e9df85749bbd834acaaaee29a0b7ec89c49612328802516bea71126a511252973b1edb8b906f2f934')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
