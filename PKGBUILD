# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matlab
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="'MATLAB' Emulation Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('618b1d0da2fe8d55c74aaf1d470138d2')
b2sums=('2eae11813ce31fbfca0cb3b42ccc77a892070d3776e5156907f93c444b815e7a8e37c4fc771ce67d0fa5928c955ad4dea676915c819c565f140a128975d2b132')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
