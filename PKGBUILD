# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evmix
_pkgver=2.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Extreme Value Mixture Modelling, Threshold Estimation and Boundary Corrected Kernel Density Estimation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-gsl
  r-sparsem
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('20660d1aedd961d7c1224679ab25328c')
b2sums=('dd63aa8b37f2a4be16c760fccb52dc704059304f01ddf5df5e150eed44df6407b60efd9faf3c54bd8013feff9144e558f85d3c63b23ea221734ee0a8fc17f983')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
